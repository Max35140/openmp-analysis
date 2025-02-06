#!/bin/bash

# Sofort beenden, wenn ein Befehl mit einem nicht-null Status endet
set -e

# Überprüfen, ob das Verzeichnis des Repositories übergeben wurde
if [ -z "$1" ]; then
    echo "Usage: $0 <repository-directory>"
    exit 1
fi

# Das Verzeichnis des Repositories aus dem Argument holen
REPO_DIR="$1"
FILE_DIR="$REPO_DIR/Assignment5_OpenMP_sections_and_tasks/student"
HEADER_DIR="$REPO_DIR/Assignment5_OpenMP_sections_and_tasks"
SOURCE_FILE="familytree_par.c"
OUTPUT_FILE="familytree_par.o"

# Ins Verzeichnis mit der Datei wechseln
cd "$FILE_DIR"

# Kompilieren der spezifischen Datei mit dem korrekten Include-Pfad
echo "Compiling $SOURCE_FILE..."
gcc -c -o "$OUTPUT_FILE" "$SOURCE_FILE" -I"$HEADER_DIR" -std=gnu99 -lpthread -fopenmp -fstrict-overflow -Werror -Wall -Wshadow -pedantic -O2

# Ausgabe bei erfolgreichem Build
echo "BUILD SUCCESSFUL"
