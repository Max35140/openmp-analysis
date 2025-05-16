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


SOURCE_FILE="$REPO_DIR/00_graph_bench/src/algorithms/openmp/DFS.c"
OUTPUT_FILE="$REPO_DIR/DFS"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/00_graph_bench/include/algorithms/openmp -I$REPO_DIR/00_graph_bench/include/config -I$REPO_DIR/00_graph_bench/include/structures -I$REPO_DIR/00_graph_bench/include/preprocess -I$REPO_DIR/00_graph_bench/include/utils -I$REPO_DIR/00_graph_bench/include/cache
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

echo "BUILD SUCCESSFUL"
