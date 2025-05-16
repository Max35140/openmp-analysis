import os
import sys
import subprocess
from pathlib import Path
sys.path.append("/home/max/Downloads/openmp-analysis2/DownloadAndBuilder")
from findTask import find_omp_task_directives

SCRIPT_STORAGE_DIR = "/home/max/Downloads/openmp-analysis2/DownloadAndBuilder/scripts/CI"


def run_make_start():
    """Führt 'make start' aus und ermittelt das neu erstellte Repository."""
    makefile_dir = "/home/max/Downloads/openmp-analysis2/DownloadAndBuilder"
    if not os.path.exists(os.path.join(makefile_dir, "Makefile")):
        print(f"Fehler: Makefile nicht gefunden unter {makefile_dir}")
        sys.exit(1)

    print("Führe 'make start' aus...")
    os.system(f"cd {makefile_dir} && make start")

    # Finde das neu erstellte Repository
    data_dir = Path(makefile_dir) / "data"
    repo_dirs = [d for d in data_dir.iterdir() if d.is_dir()]

    if not repo_dirs:
        print("Fehler: Kein Repository wurde durch 'make start' erstellt.")
        sys.exit(1)

    return repo_dirs[0]  # Nimmt das erste erstellte Repository


def extract_repo_name(repo_dir):
    """Extrahiert den Ordnernamen für das Build-Skript."""
    return Path(repo_dir).name + ".sh"


def find_missing_headers(repo_dir):
    """Durchsucht das Repository nach allen vorhandenen Header-Dateien und gibt relative Pfade mit $REPO_DIR zurück."""
    header_files = subprocess.run(["find", repo_dir, "-name", "*.h"], capture_output=True, text=True)
    header_paths = [os.path.relpath(path, repo_dir) for path in header_files.stdout.split("\n") if path.strip()]
    return set(f"$REPO_DIR/{os.path.dirname(header)}" for header in header_paths)



def generate_build_script():
    """Erstellt ein Build-Skript basierend auf OpenMP-Dateien im erstellten Repository und überschreibt alte Skripte."""
    repo_dir = run_make_start()
    omp_files = find_omp_task_directives(str(repo_dir))  # Nutzt das neue Repo

    if not omp_files:
        print("Keine OpenMP-Dateien gefunden.")
        return

    output_script_name = extract_repo_name(repo_dir)
    output_script_path = Path(SCRIPT_STORAGE_DIR) / output_script_name

    # Falls ein altes Skript existiert, wird es gelöscht
    if output_script_path.exists():
        os.remove(output_script_path)
        print(f"Altes Skript entfernt: {output_script_path}")

    # Suche nach vorhandenen Header-Dateien
    include_dirs = find_missing_headers(repo_dir)
    includes_string = " ".join(f"-I{dir}" for dir in include_dirs)

    script_content = f"""#!/bin/bash
set -e  # Sofortiges Beenden bei Fehlern

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Prüfen, ob $1 ein absoluter Pfad ist
if [[ "$1" == /* ]]; then
    REPO_DIR="$1"
else
    REPO_DIR="$(cd "$SCRIPT_DIR/../../$1" && pwd)"
fi

if [ ! -d "$REPO_DIR" ]; then
    echo "Fehler: Das Repository-Verzeichnis existiert nicht!"
    exit 1
fi

"""

    for file_path in omp_files:
        file_name = Path(file_path).stem  # Entfernt die Dateiendung
        relative_path = Path(file_path).relative_to(repo_dir)  # Relativer Pfad zum Repository

        script_content += f"""
SOURCE_FILE="$REPO_DIR/{relative_path}"
OUTPUT_FILE="$REPO_DIR/{file_name}"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp {includes_string}
echo "Erfolgreich kompiliert: $OUTPUT_FILE"
"""

    script_content += "\necho \"BUILD SUCCESSFUL\"\n"

    # Stelle sicher, dass das Speicherverzeichnis existiert
    os.makedirs(SCRIPT_STORAGE_DIR, exist_ok=True)

    # Speichert das neue Skript
    with open(output_script_path, "w") as f:
        f.write(script_content)

    # Macht das Skript ausführbar
    os.chmod(output_script_path, 0o755)
    print(f"Neues Build-Skript erstellt: {output_script_path}")


if __name__ == "__main__":
    generate_build_script()
