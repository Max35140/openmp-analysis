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

# Dateien definieren und Ausgabe-Binaries festlegen
FILES=(
    "$REPO_DIR/Trabalhos/Trabalho 2/Questão 4/Q4.c"
    "$REPO_DIR/Trabalhos/Trabalho 2/Questão 3/Q3_NRec.c"
    "$REPO_DIR/Trabalhos/Trabalho 2/Questão 3/Q3_Rec.c"
    "$REPO_DIR/Trabalhos/Trabalho 3/Trab3_Strassen_OMP.c"
)

OUTPUTS=(
    "Q4"
    "Q3_NRec"
    "Q3_Rec"
    "Trab3_Strassen_OMP"
)

# Alle Dateien kompilieren
for i in "${!FILES[@]}"; do
    SRC_FILE="${FILES[$i]}"
    OUTPUT="${OUTPUTS[$i]}"
    echo "Compiling $SRC_FILE..."
    gcc -o "$OUTPUT" "$SRC_FILE" -fopenmp -lm
done

echo "BUILD SUCCESSFUL"
