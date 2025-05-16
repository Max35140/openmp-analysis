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

SOURCE_FILE="$REPO_DIR/Laboratori/Lab3/codesLab3/mandel-omp-row-taskloop.c"
OUTPUT_FILE="$REPO_DIR/mandel-omp-row-taskloop"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/Laboratori/Lab3/codesLab3/mandel-omp-optional-row.c"
OUTPUT_FILE="$REPO_DIR/mandel-omp-optional-row"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/Laboratori/Lab3/codesLab3/mandel-omp-optional-point.c"
OUTPUT_FILE="$REPO_DIR/mandel-omp-optional-point"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/Laboratori/Lab3/codesLab3/mandel-omp-point-taskloop.c"
OUTPUT_FILE="$REPO_DIR/mandel-omp-point-taskloop"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/Laboratori/Lab3/codesLab3/mandel-omp-point-task.c"
OUTPUT_FILE="$REPO_DIR/mandel-omp-point-task"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/Laboratori/Lab3/codesLab3/mandel-omp-point-taskloop-nogroup.c"
OUTPUT_FILE="$REPO_DIR/mandel-omp-point-taskloop-nogroup"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/Laboratori/Lab5/codesLab5/solver-omp-optional2.c"
OUTPUT_FILE="$REPO_DIR/solver-omp-optional2"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/Laboratori/Lab5/codesLab5/solver-omp-optional1.c"
OUTPUT_FILE="$REPO_DIR/solver-omp-optional1"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

echo "BUILD SUCCESSFUL"
