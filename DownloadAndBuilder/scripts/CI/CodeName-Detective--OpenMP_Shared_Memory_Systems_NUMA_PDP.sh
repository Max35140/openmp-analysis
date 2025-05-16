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

# Include-Pfad für 2DArray.h
INCLUDE_DIR="$REPO_DIR/Matrix_Multiplication"

compile_file() {
    SOURCE_FILE="$REPO_DIR/$1"
    OUTPUT_FILE="$REPO_DIR/$(basename "$SOURCE_FILE" .cpp)"

    if [ ! -f "$SOURCE_FILE" ]; then
        echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
        exit 1
    fi

    echo "Kompiliere: $SOURCE_FILE mit Include-Pfad $INCLUDE_DIR..."
    g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I"$INCLUDE_DIR"
    echo "Erfolgreich kompiliert: $OUTPUT_FILE"
}

compile_file "linked.cpp"
compile_file "Matrix_Multiplication/matmul_recur.cpp"
compile_file "Matrix_Multiplication/matmul_stras.cpp"

echo "BUILD SUCCESSFUL"
