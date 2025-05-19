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


SOURCE_FILE="$REPO_DIR/documentation/third_party_code/omp_quick_sort.c"
OUTPUT_FILE="$REPO_DIR/omp_quick_sort"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/performance_analytics/sorting -I$REPO_DIR/dependence_analytics -I$REPO_DIR/performance_analytics/omp -I$REPO_DIR/performance_analytics/utils
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/performance_analytics/omp_dev/quick.c"
OUTPUT_FILE="$REPO_DIR/quick"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/performance_analytics/sorting -I$REPO_DIR/dependence_analytics -I$REPO_DIR/performance_analytics/omp -I$REPO_DIR/performance_analytics/utils
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

echo "BUILD SUCCESSFUL"
