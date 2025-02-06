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
FILE_DIR="$REPO_DIR"
SOURCE_FILE="main.cpp"
OUTPUT_FILE="main.o"
INCLUDE_DIR="$REPO_DIR/include"  # Verzeichnis, in dem sich templet.hpp befindet

# Ins Verzeichnis mit der Datei wechseln
cd "$FILE_DIR"

# Kompilieren der spezifischen Datei und den Include-Pfad explizit setzen
echo "Compiling $SOURCE_FILE..."
g++ -c -o "$OUTPUT_FILE" "$SOURCE_FILE" -std=c++14 -fopenmp -Wall -Wshadow -pedantic -O2 -I"$INCLUDE_DIR"

# Ausgabe bei erfolgreichem Build
echo "BUILD SUCCESSFUL"
