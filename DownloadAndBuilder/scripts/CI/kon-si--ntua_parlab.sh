#!/bin/bash
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


SOURCE_FILE="$REPO_DIR/lab2/code/FW/fw_pr.c"
OUTPUT_FILE="$REPO_DIR/fw_pr"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/lab4/code/ll -I$REPO_DIR/lab6/code/mpi -I$REPO_DIR/lab5/code/helper_functions -I$REPO_DIR/lab6/code/serial -I$REPO_DIR/lab3/code/locks -I$REPO_DIR/lab2/code/FW -I$REPO_DIR/lab2/code/kmeans -I$REPO_DIR/lab4/code/lib -I$REPO_DIR/lab3/code
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

echo "BUILD SUCCESSFUL"
