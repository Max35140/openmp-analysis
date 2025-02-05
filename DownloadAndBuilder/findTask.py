import os

def find_omp_task_directives(repo_dir):
    omp_task_files = []
    for root, dirs, files in os.walk(repo_dir):
        for file in files:
            if file.endswith(".c") or file.endswith(".cpp"):
                file_path = os.path.join(root, file)
                with open(file_path, 'r') as f:
                    for line in f:
                        if "#pragma omp task" in line:
                            omp_task_files.append(file_path)
                            break
    return omp_task_files

def main():
    repo_dir = "/home/max/Downloads/openmp-analysis/DownloadAndBuilder/data/PanosAntoniadis--pps-ntua"
    omp_task_files = find_omp_task_directives(repo_dir)
    if omp_task_files:
        print("Die folgenden Dateien enthalten die '#pragma omp task' Direktive:")
        for file in omp_task_files:
            print(file)
    else:
        print("Keine Dateien mit der '#pragma omp task' Direktive gefunden.")

if __name__ == "__main__":
    main()
