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


SOURCE_FILE="$REPO_DIR/update-task.c"
OUTPUT_FILE="$REPO_DIR/update-task"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/sylvester.c"
OUTPUT_FILE="$REPO_DIR/sylvester"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/random.c"
OUTPUT_FILE="$REPO_DIR/random"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/validation.c"
OUTPUT_FILE="$REPO_DIR/validation"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/majorant.c"
OUTPUT_FILE="$REPO_DIR/majorant"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

echo "BUILD SUCCESSFUL"
