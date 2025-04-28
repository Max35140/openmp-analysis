.PHONY: search download paths


paths: results

results:
	mkdir -p results/bin
	mkdir -p results/tmp

search:	results
	python `pwd`/GithubSearchModule/searchRepos.py --searchqueries `pwd`/GithubSearchModule/queries/default_search.queries --codequeries `pwd`/GithubRepoSearchModule/queries/default_code.queries --api rest --found_file `pwd`/results/search_result.csv --data_dir results --evaluated_file `pwd`/results/eval.csv

./results/search_result.csv: search

download:	./results/search_result.csv
	python ./DownloadAndBuilder/other_scripts/download_repos.py --basePath DownloadAndBuilder --repoPath `pwd`/results/tmp  --csvOutput results/finished_repos.csv --verbose --intermediateResultsFile `pwd`/results/work_in_progress.csv --buildScriptPath `pwd`/DownloadAndBuilder/scripts  `pwd`/results/search_result.csv



