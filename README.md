# OpenMP usage analysis

## Installation
1. refer to `requirements.txt` to setup the necessary python environment (`pip install -r requirements.txt`)
3. To use the search phase of the program, a GitHub Personal Access Token (PAT) is required. This token must have the necessary permissions to access repository data and can be set using:
```sh
export GITHUB_KEY=<private_key>
```

## Usage
Set the `PYTHONPATH` environment variable to the top level directory of this repo. Scripts offer `--help` option for detailed usage explanation.
* `GitHubSearchModle` is used to query the GitHub API to discover relevant repos, refer to `search_repos.py`
  * To use the `dowload_repos.py` script you have to provide these three variables: BASE_PATH, REPO_PATH and SCRIPT_PATH
* `AnalyzeModule` is used to perform the analysis of the binaries, refer to `analyze.py`
  * The analysis expects the list of repositories to analyze alongside the scripts to build them. The build scripts can be found in our Data Repository: https://github.com/tudasc/openmp-analysis-data
  * To execute the analysis, use the following command. Ensure that the directories specified for --data_dir and --results_dir exist beforehand as empty directories:
  ```sh
  python analyze.py --data_dir /REPOS/ --results_dir /RESULTS/ --build_script_dir /scripts --repo_list ci_result.csv
  ```
* The `explore_result.ipnb` jupyther notebook was used to create all the plots in our publication. Note that jupyther is not included in the `requirements.txt` 
