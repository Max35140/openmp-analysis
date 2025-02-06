#!/bin/bash

# Sofort beenden, wenn ein Befehl mit einem nicht-null Status endet
set -e

# Überprüfen, ob das Verzeichnis des Repositories übergeben wurde
if [ -z "$1" ];then
    echo "Usage: $0 <repository-directory>"
    exit 1
fi

# Das Verzeichnis des Repositories aus dem Argument holen
REPO_DIR="$1/assignment_2"

# Ins Verzeichnis mit der Makefile wechseln
cd "$REPO_DIR"

# Bereinigung der vorherigen Build-Artefakte
echo "Cleaning up previous build artifacts..."
make clean || true  # Fehler im make clean Schritt ignorieren

# Ausführen der Makefile mit überschriebenem CC
echo "Building the project with gcc instead of gcc-7..."
make CC=gcc

# Ausgabe bei erfolgreichem Build
echo "BUILD SUCCESSFUL"
