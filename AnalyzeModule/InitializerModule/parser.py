import argparse

# This class parses user input. If you wish to extend this, just add a new argument and return it inside of the dict at the end.
# The dict currently contains the path to both files, the name for the DB collection and the API.
class Parser:

    @staticmethod
    def parseInput():
        parser = argparse.ArgumentParser()
        parser.add_argument("--refresh", action='store_true',
                                  help='Re evaluate all repositories and re-fresh their analysis results')
        parser.add_argument("--print_cfg", action='store_true',
                                  help='prints a CFG for each binary analyzed')
        parser.add_argument("--data_dir", help="Location where the repositories are lying", required = True)
        parser.add_argument("--results_dir", help="Location where the results should be stored", required = True)
        parser.add_argument("--ignore_endings", default=None, action='store', help='Path to the file containing the file endings to be ignored.')
        parser.add_argument("--ignore_folders", default=None, action="store", help="Path to the file containing the folder names to be ignored.")

        return parser.parse_args()
