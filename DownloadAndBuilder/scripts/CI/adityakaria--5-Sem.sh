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


SOURCE_FILE="$REPO_DIR/pc/lab3/fibonacci_numbers.c"
OUTPUT_FILE="$REPO_DIR/fibonacci_numbers"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/acd/yacc/while -I$REPO_DIR/acd/yacc/calc/test -I$REPO_DIR/acd/yacc/calc/test/sc-calc -I$REPO_DIR/acd/yacc/switch -I$REPO_DIR/acd/yacc/test -I$REPO_DIR/acd/yacc/palindrome -I$REPO_DIR/acd/yacc/assgnt -I$REPO_DIR/acd/yacc/sql-parser/test1
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/pc/lab3/quicksort.c"
OUTPUT_FILE="$REPO_DIR/quicksort"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/acd/yacc/while -I$REPO_DIR/acd/yacc/calc/test -I$REPO_DIR/acd/yacc/calc/test/sc-calc -I$REPO_DIR/acd/yacc/switch -I$REPO_DIR/acd/yacc/test -I$REPO_DIR/acd/yacc/palindrome -I$REPO_DIR/acd/yacc/assgnt -I$REPO_DIR/acd/yacc/sql-parser/test1
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/pc/lab3/fib.c"
OUTPUT_FILE="$REPO_DIR/fib"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/acd/yacc/while -I$REPO_DIR/acd/yacc/calc/test -I$REPO_DIR/acd/yacc/calc/test/sc-calc -I$REPO_DIR/acd/yacc/switch -I$REPO_DIR/acd/yacc/test -I$REPO_DIR/acd/yacc/palindrome -I$REPO_DIR/acd/yacc/assgnt -I$REPO_DIR/acd/yacc/sql-parser/test1
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

echo "BUILD SUCCESSFUL"
