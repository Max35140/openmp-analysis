import re

import angr
import networkx
import networkx as nx
import pandas as pd
from angrutils import plot_cfg

from AnalyzeModule.AnalysisModule.CFGAnalysis import get_loop_guard, get_block_weight, remove_back_edges, \
    get_pruned_cfg, get_loop_nodes
from AnalyzeModule.AnalysisModule.ThreadNumAnalysis import get_instructions_based_on_thread_num, \
    dynamic_scheduling_funcs

hex_pattern = re.compile("0[xX][0-9a-fA-F]+")

col_names = ["name", "addr", "instructions_flat", "instructions_weighted", "default_tripcount_loops",
             "known_tripcount_loops", "thread_dependant_trip_count_loops", "recursions"]


def get_region(name, start_addr):
    return pd.Series(data=[name, start_addr] + [0 for i in range(len(col_names) - 2)], index=col_names)


def combine_region(region_a, region_b, weight=1):
    cols_to_combine = [c for c in col_names if c not in ["name", "addr", "instructions_weighted"]]
    region_a[cols_to_combine] += region_b[cols_to_combine]
    region_a["instructions_weighted"] += region_b["instructions_weighted"] * weight
    return region_a


PRINT_ANALYSIS_PROGRES = True


class OpenMPRegionAnalysis(angr.Analysis):

    def __init__(self, default_trip_count_guess):
        self.default_trip_count_guess = default_trip_count_guess

        self.result = pd.DataFrame(columns=col_names)
        if PRINT_ANALYSIS_PROGRES:
            print("collect CFG")
        self.cfg = self.project.analyses.CFGFast(normalize=True, show_progressbar=PRINT_ANALYSIS_PROGRES)
        self.openmp_regions = [func for addr, func in self.kb.functions.items() if '._omp_fn.' in func.name]

        if len(self.openmp_regions) == 0:
            return
        # abort early, if no openmp was found, no need to perform further graph analyses
        # detect loops
        if PRINT_ANALYSIS_PROGRES:
            print("prune CFG")
        self.per_function_cfg = get_pruned_cfg(self.cfg.graph)

        if PRINT_ANALYSIS_PROGRES:
            print("collect callgraph")
        self.callgraph = self.kb.callgraph
        if PRINT_ANALYSIS_PROGRES:
            print("detect recursions")
        # detect recursion
        self.callgraph_cycles = list(nx.simple_cycles(self.callgraph))

        # cache the analyzed functions
        self.function_analysis_result_cache = {}

        # perform analysis
        self.run()

    def handleRecursion(self, region):
        region['recursions'] += 1

    def handleLoop(self, back_edge, this_function_cfg, this_function_loop_free_cfg, entry_node, region):
        # try to get trip count of loop

        trip_count_guess = self.get_tripcount_guess(entry_node, back_edge, this_function_cfg,
                                                    this_function_loop_free_cfg)

        if trip_count_guess == 'DEFAULT':
            region['default_tripcount_loops'] += 1
            trip_count_guess = self.default_trip_count_guess
        elif trip_count_guess == 'DEPEND_ON_THREAD_NUM':
            trip_count_guess = 1
            region['thread_dependant_trip_count_loops'] += 1
        else:
            region['known_tripcount_loops'] += 1
        return trip_count_guess

    def get_tripcount_guess(self, entry_node, back_edge, this_function_cfg, this_function_loop_free_cfg):
        trip_count_guess = 'DEFAULT'
        guard_block_addr = get_loop_guard(back_edge, this_function_cfg, this_function_loop_free_cfg, entry_node)
        if guard_block_addr is not None:
            guard_block = self.project.factory.block(guard_block_addr.addr)
            if guard_block.instructions >= 2:  # has another instruction
                # static schedule
                if guard_block.disassembly.insns[-2].mnemonic == "cmp":
                    cmp = guard_block.disassembly.insns[-2]
                    # found the loops cmp instruction
                    # check if it has a constant value
                    operand_1 = cmp.op_str.split(',')[0].strip()
                    operand_2 = cmp.op_str.split(',')[1].strip()
                    as_int = None
                    try:
                        as_int = int(operand_2)  # decimal constant
                    except ValueError:
                        pass
                    if hex_pattern.match(operand_2):  # is hexnum
                        as_int = int(operand_2[2:], 16)
                    if as_int is not None:
                        # print("Found Constant Trip count of loop: %d" % int(as_int))
                        # check if other opreand is incremented by 1 every loop trip
                        for bb_addr in get_loop_nodes(back_edge, this_function_loop_free_cfg):
                            bb = self.project.factory.block(bb_addr.addr)
                            for inst in bb.disassembly.insns:
                                if inst.mnemonic == 'add':
                                    if inst.op_str.split(',')[0].strip() == operand_1:
                                        if inst.op_str.split(',')[1].strip() == '1':
                                            # found increment by 1
                                            trip_count_guess = int(as_int)
                                            break
                    # end if as_int not None

                    # check if val is known to be based of num_threads
                    if cmp.address in get_instructions_based_on_thread_num(self.project, self.cfg,
                                                                           this_function_loop_free_cfg, entry_node):
                        assert trip_count_guess == 'DEFAULT'
                        # print("Found Trip count dependent on NUM_THREADS")
                        trip_count_guess = 'DEPEND_ON_THREAD_NUM'
                # dynamic schedule
                elif guard_block.disassembly.insns[-2].mnemonic == "test":
                    predecessors = list(this_function_cfg.predecessors(guard_block_addr))
                    if len(predecessors) == 1:
                        if (this_function_cfg[predecessors[0]][guard_block_addr]['jumpkind'] == 'Ijk_FakeRet'):
                            tgt_func = None
                            for tgt, jmp_kind in self.cfg.get_successors_and_jumpkind(predecessors[0]):
                                # handle call
                                if jmp_kind == 'Ijk_Call':
                                    assert tgt_func is None
                                    tgt_func = self.kb.functions.get_by_addr(tgt.addr)

                            if tgt_func.name in dynamic_scheduling_funcs:
                                assert trip_count_guess == 'DEFAULT'
                                # print("Found loop with dynamic schedule: Trip count dependent on NUM_THREADS")
                                trip_count_guess = 'DEPEND_ON_THREAD_NUM'

        return trip_count_guess

    def analyze_function(self, func):
        if func in self.function_analysis_result_cache:
            return self.function_analysis_result_cache[func]
        if PRINT_ANALYSIS_PROGRES:
            print("analyze function: " + func.name)

        # initialize empty new region
        current_region = get_region(func.name, func.addr)

        function_entry_cfg_node = self.cfg.get_node(func.addr)
        assert function_entry_cfg_node is not None
        this_function_cfg = networkx.subgraph(self.per_function_cfg,
                                              {function_entry_cfg_node} | networkx.descendants(self.per_function_cfg,
                                                                                               function_entry_cfg_node))
        # remove all back edges from cfg to approximate the branch nesting level of each block
        loop_free_cfg, back_edges = remove_back_edges(this_function_cfg, function_entry_cfg_node)
        # end for each block

        # instruction weight of each block
        block_weights = get_block_weight(loop_free_cfg, function_entry_cfg_node)

        # handle loops
        for back_edge in back_edges:
            loop_trip_count_factor = self.handleLoop(back_edge, this_function_cfg, loop_free_cfg,
                                                     function_entry_cfg_node,
                                                     current_region)

            for block in get_loop_nodes(back_edge, loop_free_cfg):
                block_weights[block] *= loop_trip_count_factor

        for block in func.blocks:
            cfg_node = self.cfg.get_node(block.addr)
            if cfg_node not in this_function_cfg.nodes:
                weight = 1
                # TODO why does this happen?
            else:
                weight = block_weights[cfg_node]
            for inst in block.disassembly.insns:
                # how to retrieve the disassembly memonic:
                # print(inst.mnemonic)
                current_region["instructions_weighted"] += 1 * weight
                current_region["instructions_flat"] += 1

            # successors
            for tgt, jmp_kind in self.cfg.get_successors_and_jumpkind(cfg_node):
                # handle call
                if jmp_kind == 'Ijk_Call':
                    tgt_func = self.kb.functions.get_by_addr(tgt.addr)
                    if not tgt_func == func:
                        target_call_region = self.analyze_function(tgt_func)
                        # TODO use block weight?
                        combine_region(current_region, target_call_region)
                    else:
                        # simple recursion
                        # nothing to do, recursion is handled later
                        pass
                pass
        # end for each block

        # handle recursion
        # can detect recursion with self.callgraph_cycles
        for cycle in self.callgraph_cycles:
            if func.addr in cycle:
                self.handleRecursion(current_region)

        self.function_analysis_result_cache[func] = current_region
        return current_region

    def run(self):
        for i, func in enumerate(self.openmp_regions):
            if PRINT_ANALYSIS_PROGRES:
                self.result.loc[i] = self.analyze_function(func)


angr.analyses.register_analysis(OpenMPRegionAnalysis,
                                'OpenMPRegionAnalysis')  # register the class with angr's global analysis list


class AsmAnalyzer:
    __slots__ = ()

    def __init__(self):
        pass

    # perform the analyses
    def __call__(self, source, outfile, default_trip_count_guess, print_cfg=False):
        proj = angr.Project(source, load_options={'auto_load_libs': False})

        if print_cfg:
            assert False and "NOT IMPLEMENTED WITHOUT INSTALLING ANGRUTILS"
            cfg = proj.analyses.CFGFast(normalize=True)
            functions = dict(proj.kb.functions)
            for addr, func in functions.items():
                # Edges Style:
                # Edge class 	Color 	Style
                # Conditional True 	Green
                # Conditional False 	Red
                # Unconditional 	Blue
                # Next 	Blue 	Dashed
                # Call 	Black
                # Return 	Gray
                # Fake Return 	Gray 	Dotted
                # Unknown 	Orange
                fname_to_use = outfile + "_" + func.name
                plot_cfg(cfg, fname_to_use, asminst=True, func_addr={func.addr: True}, remove_imports=True,
                         remove_path_terminator=True)

        parallel_regions = proj.analyses.OpenMPRegionAnalysis(default_trip_count_guess).result
        assert isinstance(parallel_regions, pd.DataFrame)

        if len(parallel_regions) > 0:
            total_instructions_count = 0
            # Iterate over all functions in the binary
            for addr, func in proj.kb.functions.items():
                # Iterate over all basic blocks in the function
                for block in func.blocks:
                    # Get the count of assembly instructions in the basic block
                    # Add the count of assembly instructions in the basic block to the total count
                    total_instructions_count += len(block.capstone.insns)

            parallel_regions['TOTAL_FILE_INSTR_COUNT'] = total_instructions_count
            parallel_regions['DEFAULT_TRIPCOUNT_GUESS'] = default_trip_count_guess



            parallel_regions.to_csv(outfile)

        return 0
