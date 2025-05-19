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


SOURCE_FILE="$REPO_DIR/src/vecAdd/matmul_tiled.c"
OUTPUT_FILE="$REPO_DIR/matmul_tiled"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/mining/motif_dfs -I$REPO_DIR/src/mst -I$REPO_DIR/mining/fsm1 -I$REPO_DIR/src/pr -I$REPO_DIR/include -I$REPO_DIR/src/bc -I$REPO_DIR/src/sssp -I$REPO_DIR/src/bfs -I$REPO_DIR/mining/kcl_bfs -I$REPO_DIR/include/gpu_mining -I$REPO_DIR/src/spmv -I$REPO_DIR/mining/sgl -I$REPO_DIR/include/mining/bliss -I$REPO_DIR/src/cc -I$REPO_DIR/src/tc -I$REPO_DIR/mining/fsm2 -I$REPO_DIR/src/vc -I$REPO_DIR/src/symgs -I$REPO_DIR/src/sgd -I$REPO_DIR/src/scc -I$REPO_DIR/include/mining -I$REPO_DIR/mining/motif_bfs -I$REPO_DIR/mining/kcl_dfs -I$REPO_DIR/mining/fsm -I$REPO_DIR/include/dfscode
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

echo "BUILD SUCCESSFUL"
