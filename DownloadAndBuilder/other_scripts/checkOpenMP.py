import csv
import os
import subprocess

CSV_FILE = "/home/max/Downloads/openmp-analysis2/GithubSearchModule/found_repos.csv"
TEMP_DIR = "./temp_repos"

# Deinen GitHub-Token setzen (besser als Umgebungsvariable!)
GITHUB_KEY = os.getenv("GITHUB_KEY")


def clone_and_check_openmp(repo_url, repo_name, repo_number, found_count):
	""" Klont das Repository mit GitHub-Token und sucht nach #include <omp.h> in C/C++-Dateien. """
	repo_url = repo_url.replace("https://github.com", f"https://{GITHUB_KEY}@github.com")  # Token in URL einfügen
	repo_path = os.path.join(TEMP_DIR, repo_name)

	print(
		f"Prüfe Repository {repo_number}: {repo_name} (Gefunden bisher: {found_count})")  # Name + bisher gefundene Repos

	subprocess.run(["git", "clone", "--depth", "1", repo_url, repo_path], stdout=subprocess.DEVNULL,
				   stderr=subprocess.DEVNULL)

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


def count_openmp_repos(csv_file, start_from):
	""" Liest die CSV-Datei und zählt die Repositories mit OpenMP-Nutzung. Startet ab einer bestimmten Stelle. """
	openmp_count = 0
	with open(csv_file, "r", encoding="utf-8") as file:
		reader = list(csv.DictReader(file))
		total_repos = len(reader)

		print(f"Insgesamt {total_repos} Repositories gefunden.")
		if start_from > total_repos:
			print("Der eingegebene Startpunkt liegt außerhalb der Repository-Liste!")
			return 0

		for repo_number, row in enumerate(reader[start_from - 1:], start=start_from):  # Überspringt vorherige Repos
			repo_url = row["URL"]
			repo_name = row["Code"].split("/")[-1]
			if clone_and_check_openmp(repo_url, repo_name, repo_number, openmp_count):
				openmp_count += 1

	return openmp_count


# Erstelle temporären Ordner
os.makedirs(TEMP_DIR, exist_ok=True)

# Nutzer kann eingeben, ab welchem Repo weitergemacht werden soll
start_repo = int(input("Ab welcher Repository-Nummer möchtest du weitermachen? (1 - max Anzahl) "))

# Suche starten
openmp_repo_count = count_openmp_repos(CSV_FILE, start_repo)

print(f"Anzahl der Repositories mit OpenMP: {openmp_repo_count}")
