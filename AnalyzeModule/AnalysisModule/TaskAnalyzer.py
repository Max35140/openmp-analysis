import angr
import pandas as pd
import re

class TaskAnalyzer:
    def __init__(self):
        pass

    def __call__(self, source, outfile, default_trip_count_guess):
        analyze_object_file(source, outfile)
        #proj = angr.Project(source, load_options={'auto_load_libs': False})
        #parallel_regions = proj.analyses.OpenMPRegionAnalysis(default_trip_count_guess).result
        #assert isinstance(parallel_regions, pd.DataFrame)

        #if len(parallel_regions) > 0:
        #    total_instructions_count = 0
        #    task_instructions_count = 0

        #    for addr, func in proj.kb.functions.items():
        #        for block in func.blocks:
        #            instr_count = len(block.capstone.insns)
        #            total_instructions_count += instr_count
        #            for inst in block.capstone.insns:
        #                print(inst)
        #    parallel_regions['TOTAL_FILE_INSTR_COUNT'] = total_instructions_count
        #    parallel_regions['TASK_INSTR_COUNT'] = task_instructions_count
        #    parallel_regions['DEFAULT_TRIPCOUNT_GUESS'] = default_trip_count_guess
        #    parallel_regions.to_csv(outfile)

        return 0

col_names = ["name", "addr", "instructions_flat", "instructions_weighted", "task_instructions"]

def get_region(name, start_addr):
    return pd.Series(data=[name, start_addr] + [0 for i in range(len(col_names) - 2)], index=col_names)

def combine_region(region_a, region_b, weight=1):
    cols_to_combine = [c for c in col_names if c not in ["name", "addr", "instructions_weighted"]]
    region_a[cols_to_combine] += region_b[cols_to_combine]
    region_a["instructions_weighted"] += region_b["instructions_weighted"] * weight
    return region_a

class OpenMPRegionAnalysis(angr.Analysis):
    def __init__(self, default_trip_count_guess):
        self.default_trip_count_guess = default_trip_count_guess
        self.result = pd.DataFrame(columns=col_names)
        self.cfg = self.project.analyses.CFGFast(normalize=True, show_progressbar=True)
        self.openmp_regions = [func for addr, func in self.kb.functions.items() if '._omp_fn.' in func.name]
        if len(self.openmp_regions) == 0:
            return

        self.run()

    def analyze_function(self, func):
        current_region = get_region(func.name, func.addr)

        for block in func.blocks:
            for inst in block.disassembly.insns:
                current_region["instructions_weighted"] += 1
                current_region["instructions_flat"] += 1
        return current_region

    def run(self):
        for i, func in enumerate(self.openmp_regions):
            self.result.loc[i] = self.analyze_function(func)

angr.analyses.register_analysis(OpenMPRegionAnalysis, 'OpenMPRegionAnalysis')

import subprocess
import re

def get_disassembly(object_file_path):
    result = subprocess.run(['objdump', '-d', object_file_path], capture_output=True, text=True, check=True)
    return result.stdout

def find_relevant_omp_fn(disassembly):
    gomp_task_pattern = re.compile(r'call\s+[0-9a-f]+\s+<GOMP_task@plt>')
    omp_fn_pattern = re.compile(r'([0-9a-f]+)\s+<main\._omp_fn\.[0-9]+>')

    task_function_addresses = set()

    for i, line in enumerate(disassembly.splitlines()):
        if gomp_task_pattern.search(line):
            # Look for call instructions around the GOMP_task call
            for j in range(max(0, i-10), min(len(disassembly.splitlines()), i+10)):
                match = omp_fn_pattern.search(disassembly.splitlines()[j])
                if match:
                    task_function_addresses.add(match.group(1))
                    break

    return task_function_addresses

def count_instructions(disassembly, function_start_addresses):
    instruction_count = 0
    processed_functions = set()

    def count_in_function(start_address):
        nonlocal instruction_count
        if start_address in processed_functions:
            return
        processed_functions.add(start_address)

        in_function = False
        function_pattern = re.compile(r'^\s*' + re.escape(start_address) + r':\s+[0-9a-f]+\s+.*$')
        call_pattern = re.compile(r'\s*[0-9a-f]+:\s+([0-9a-f]+\s+)*call\s+([0-9a-f]+)\s+<.*>')

        print(f"Checking function start: {start_address}")

        for line in disassembly.splitlines():
            if function_pattern.match(line):
                print(f"Entering function: {start_address}")
                in_function = True
                continue
            if in_function:
                if re.match(r'\s*[0-9a-f]+:\s+[0-9a-f]+', line):
                    instruction_count += 1
                    print(f"Counting instruction: {line.strip()}")
                call_match = call_pattern.search(line)
                if call_match:
                    called_address = call_match.group(2)
                    print(f"Function {start_address} calls {called_address}")
                    count_in_function(called_address)
                if re.match(r'^\s*[0-9a-f]+ <.*>:', line):
                    in_function = False
                    print(f"Exiting function: {start_address}")
                    break

    for start_address in function_start_addresses:
        count_in_function(start_address)

    return instruction_count

def analyze_object_file(object_file_path, result_file_path):
    try:
        disassembly = get_disassembly(object_file_path)
        relevant_omp_fn_addresses = find_relevant_omp_fn(disassembly)
        task_instruction_count = count_instructions(disassembly, relevant_omp_fn_addresses)

        with open(result_file_path, 'w') as result_file:
            result_file.write(f'Task Instruction Count: {task_instruction_count}\n')

        print(f'Analysis complete. Result saved to {result_file_path}')
    except subprocess.CalledProcessError as e:
        print(f'Error disassembling object file: {e}')
    except Exception as e:
        print(f'Error analyzing object file: {e}')
