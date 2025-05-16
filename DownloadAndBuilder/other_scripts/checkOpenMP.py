import csv
import os
import subprocess

CSV_FILE = "/home/max/Downloads/openmp-analysis2/DownloadAndBuilder/found_repos.csv"
TEMP_DIR = "./temp_repos"

def clone_and_check_openmp(repo_url, repo_name):
    """ Klont das Repository und sucht nach #include <omp.h> in C/C++-Dateien. """
    repo_path = os.path.join(TEMP_DIR, repo_name)
    subprocess.run(["git", "clone", "--depth", "1", repo_url, repo_path], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

    openmp_found = False
    for root, _, files in os.walk(repo_path):
        for file in files:
            if file.endswith((".c", ".cpp")):
                file_path = os.path.join(root, file)
                try:
                    with open(file_path, "r", encoding="utf-8") as f:
                        if "#include <omp.h>" in f.read():
                            openmp_found = True
                            break
                except Exception:
                    continue
        if openmp_found:
            break

    subprocess.run(["rm", "-rf", repo_path])  # Repository nach der Prüfung löschen
    return openmp_found

def count_openmp_repos(csv_file):
    """ Liest die CSV-Datei und zählt die Repositories mit OpenMP-Nutzung. """
    openmp_count = 0
    with open(csv_file, "r", encoding="utf-8") as file:
        reader = csv.DictReader(file)
        for row in reader:
            repo_url = row["URL"]
            repo_name = row["Code"].split("/")[-1]
            if clone_and_check_openmp(repo_url, repo_name):
                openmp_count += 1

    return openmp_count

# Erstelle temporären Ordner
os.makedirs(TEMP_DIR, exist_ok=True)

# Suche starten
openmp_repo_count = count_openmp_repos(CSV_FILE)

print(f"Anzahl der Repositories mit OpenMP: {openmp_repo_count}")
