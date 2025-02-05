import angr
import pandas as pd
from angrutils import plot_cfg

class TaskAnalyzer:
	__slots__ = ()

	def __init__(self):
		pass

	# perform the analyses
	def __call__(self, source, outfile, default_trip_count_guess, print_cfg):
		proj = angr.Project(source, load_options={'auto_load_libs': False})
		if print_cfg:
			cfg = proj.analyses.CFGFast(normalize=True)
			functions = dict(proj.kb.functions)
			for addr, func in functions.items():
				fname_to_use = outfile + "_" + func.name
				plot_cfg(cfg, fname_to_use, asminst=True, func_addr={func.addr: True}, remove_imports=True,
                         remove_path_terminator=True)
		parallel_regions = proj.analyses.OpenMPRegionAnalysis(default_trip_count_guess).result
		print("JA: ", parallel_regions)
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