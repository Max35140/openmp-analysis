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

# Ins Verzeichnis mit der makefile wechseln
cd "$REPO_DIR"

# Bereinigung der vorherigen Build-Artefakte
echo "Cleaning up previous build artifacts..."
make clean || true  # Fehler im make clean Schritt ignorieren

# Setzen der Umgebungsvariablen und Bibliothekspfade
export CFLAGS="-I/usr/local/include"
export LDFLAGS="-L/usr/local/lib -lmpfr -lm"

# Ausführen der makefile
echo "Building the project..."
make

echo "BUILD SUCCESSFUL"
