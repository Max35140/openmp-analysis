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


def analyze_object_file(object_file_path, result_file_path):
    try:
        # Disassemble the object file using objdump
        result = subprocess.run(['objdump', '-d', object_file_path], capture_output=True, text=True, check=True)
        disassembly = result.stdout

        # Print disassembly for debugging
        print(disassembly)

        # Search for functions generated by OpenMP task constructs
        task_function_pattern = re.compile(r'^([0-9a-f]+) <(.*\._omp_fn\..*)>:$')
        in_task_function = False
        task_instruction_count = 0
        task_function_start_addresses = set()

        # Step 1: Identify start addresses of OpenMP-generated functions
        for line in disassembly.splitlines():
            match = task_function_pattern.match(line)
            if match:
                start_address = match.group(1)
                task_function_start_addresses.add(start_address)
                print(f'Identified OpenMP task function start address: {start_address}')  # Debugging line

        # Step 2: Count instructions in these functions
        for line in disassembly.splitlines():
            # Print each line to understand what's happening
            print(f'Processing line: {line.strip()}')  # Debugging line

            # Check if the line is the start of an OpenMP-generated function
            match = task_function_pattern.match(line)
            if match:
                if in_task_function:  # We are entering a new function, so exit the current one
                    in_task_function = False
                    print(f'Exiting OpenMP task function before entering a new one')  # Debugging line
                in_task_function = match.group(1) in task_function_start_addresses
                if in_task_function:
                    print(f'Entering OpenMP task function: {match.group(2)}')
                continue

            # Count instructions within the task function
            if in_task_function:
                if re.match(r'\s*[0-9a-f]+:\s+[0-9a-f]+', line):
                    task_instruction_count += 1
                    print(f'Counting instruction: {line.strip()}')  # Debugging line
                else:
                    print(f'Ignoring line within task function: {line.strip()}')  # Debugging line

        # Save the result to the result file
        with open(result_file_path, 'w') as result_file:
            result_file.write(f'Task Instruction Count: {task_instruction_count}\n')

        print(f'Analysis complete. Result saved to {result_file_path}')
    except subprocess.CalledProcessError as e:
        print(f'Error disassembling object file: {e}')
    except Exception as e:
        print(f'Error analyzing object file: {e}')

