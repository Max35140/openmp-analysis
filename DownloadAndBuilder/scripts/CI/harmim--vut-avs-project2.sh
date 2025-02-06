#!/bin/bash

# Sofort beenden, wenn ein Befehl mit einem nicht-null Status endet
set -e

# Prüfen, ob das Verzeichnis des Repositories übergeben wurde
if [ -z "$1" ]; then
    echo "Usage: $0 <repository-directory>"
    exit 1
fi

# Das Verzeichnis des Repositories aus dem Argument holen
REPO_DIR="$1"

# Ins Verzeichnis mit dem Makefile wechseln
cd "$REPO_DIR"

# Bereinigung der vorherigen Build-Artefakte
echo "Cleaning up previous build artifacts..."
make clean || true

echo "Loading necessary modules..."
# Wenn der Befehl `ml` nicht gefunden wird, die folgenden Zeilen auskommentieren
# ml intel CMake Python/3.6.1

# Projekt bauen
echo "Building the project..."
mkdir -p "$REPO_DIR/build"
cd "$REPO_DIR/build"
cmake "$REPO_DIR/src" -DCMAKE_BUILD_TYPE='Release'
make -j

echo "BUILD SUCCESSFUL"
