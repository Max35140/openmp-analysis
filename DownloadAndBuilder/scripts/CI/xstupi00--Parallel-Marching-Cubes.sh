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

# Include-Pfad für base_mesh_builder.h
INCLUDE_DIR="$REPO_DIR/src/common"

SOURCE_FILE="$REPO_DIR/src/parallel_builder/tree_mesh_builder.cpp"
OUTPUT_FILE="$REPO_DIR/tree_mesh_builder"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE mit Include-Pfad $INCLUDE_DIR..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I"$INCLUDE_DIR"
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

echo "BUILD SUCCESSFUL"
