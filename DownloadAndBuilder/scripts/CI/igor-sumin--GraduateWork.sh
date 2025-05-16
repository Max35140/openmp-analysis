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

# Korrekte Include-Pfade setzen
INCLUDE_DIR1="$REPO_DIR/graduatework/test"
INCLUDE_DIR2="$REPO_DIR/graduatework/test/common"

SOURCE_FILE="$REPO_DIR/graduatework/algo/impl/parallel/ParallelSweepMethod.cpp"
OUTPUT_FILE="$REPO_DIR/ParallelSweepMethod"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE mit Include-Pfaden $INCLUDE_DIR1 und $INCLUDE_DIR2..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I"$INCLUDE_DIR1" -I"$INCLUDE_DIR2"
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

echo "BUILD SUCCESSFUL"
