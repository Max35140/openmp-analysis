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

# Include-Pfade für die Header-Dateien
INCLUDE_DIR1="$REPO_DIR/tasklib/include"
INCLUDE_DIR2="$REPO_DIR/taskbenchmark/src"

SOURCE_FILE="$REPO_DIR/taskbenchmark/src/omp_bench.c"
OUTPUT_FILE="$REPO_DIR/omp_bench"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE mit Include-Pfaden $INCLUDE_DIR1 und $INCLUDE_DIR2..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I"$INCLUDE_DIR1" -I"$INCLUDE_DIR2"
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

echo "BUILD SUCCESSFUL"
