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

# Include-Pfad für adf.h
INCLUDE_DIR="$REPO_DIR/src/tests/adf_benchmarks/src"

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

compile_file "src/tests/adf_benchmarks/dwarfs/sparse_algebra/sparse_algebra_omp.cpp"
compile_file "src/tests/adf_benchmarks/dwarfs/dense_algebra/dense_algebra_omp.cpp"
compile_file "src/tests/adf_benchmarks/dwarfs/dense_algebra/cholesky/cholesky_omp.cpp"
compile_file "src/tests/adf_benchmarks/dwarfs/dense_algebra/matrix_multiplication/dense_algebra_omp.cpp"
compile_file "src/tests/adf_benchmarks/dwarfs/finite_state_machine/finite_state_machine_omp.cpp"
compile_file "src/tests/adf_benchmarks/dwarfs/map_reduce/map_reduce_omp.cpp"
compile_file "src/tests/adf_benchmarks/dwarfs/branch_bound/branch_bound_omp.cpp"
compile_file "src/tests/adf_benchmarks/dwarfs/combinatorial_logic/combinatorial_logic_omp.cpp"

echo "BUILD SUCCESSFUL"
