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


SOURCE_FILE="$REPO_DIR/fft/src/fft_ompi_trim.c"
OUTPUT_FILE="$REPO_DIR/fft_ompi_trim"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/fft/src/fft_ompi.c"
OUTPUT_FILE="$REPO_DIR/fft_ompi"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/fft/src/fft.c"
OUTPUT_FILE="$REPO_DIR/fft"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/fib/src/fib_ompi_trim.c"
OUTPUT_FILE="$REPO_DIR/fib_ompi_trim"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/fib/src/fib_ompi.c"
OUTPUT_FILE="$REPO_DIR/fib_ompi"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/fib/src/fib.c"
OUTPUT_FILE="$REPO_DIR/fib"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/uts/src/uts_ompi_trim.c"
OUTPUT_FILE="$REPO_DIR/uts_ompi_trim"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/uts/src/uts.c"
OUTPUT_FILE="$REPO_DIR/uts"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/uts/src/uts_ompi.c"
OUTPUT_FILE="$REPO_DIR/uts_ompi"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/floorplan/src/floorplan_ompi.c"
OUTPUT_FILE="$REPO_DIR/floorplan_ompi"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/floorplan/src/floorplan.c"
OUTPUT_FILE="$REPO_DIR/floorplan"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/floorplan/src/floorplan_ompi_trim.c"
OUTPUT_FILE="$REPO_DIR/floorplan_ompi_trim"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/concom/src/concom_ompi.c"
OUTPUT_FILE="$REPO_DIR/concom_ompi"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/concom/src/concom_ompi_trim.c"
OUTPUT_FILE="$REPO_DIR/concom_ompi_trim"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/concom/src/concom.c"
OUTPUT_FILE="$REPO_DIR/concom"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/sort/src/sort.c"
OUTPUT_FILE="$REPO_DIR/sort"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/sort/src/sort_ompi_trim.c"
OUTPUT_FILE="$REPO_DIR/sort_ompi_trim"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/sort/src/sort_ompi.c"
OUTPUT_FILE="$REPO_DIR/sort_ompi"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/health/src/health.c"
OUTPUT_FILE="$REPO_DIR/health"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/health/src/health_ompi_trim.c"
OUTPUT_FILE="$REPO_DIR/health_ompi_trim"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/health/src/health_ompi.c"
OUTPUT_FILE="$REPO_DIR/health_ompi"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/nqueens/src/nqueens.c"
OUTPUT_FILE="$REPO_DIR/nqueens"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/nqueens/src/nqueens_ompi_trim.c"
OUTPUT_FILE="$REPO_DIR/nqueens_ompi_trim"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/nqueens/src/nqueens_ompi.c"
OUTPUT_FILE="$REPO_DIR/nqueens_ompi"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/knapsack/src/knapsack_ompi.c"
OUTPUT_FILE="$REPO_DIR/knapsack_ompi"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/knapsack/src/knapsack.c"
OUTPUT_FILE="$REPO_DIR/knapsack"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/knapsack/src/knapsack_ompi_trim.c"
OUTPUT_FILE="$REPO_DIR/knapsack_ompi_trim"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/strassen/src/strassen_ompi.c"
OUTPUT_FILE="$REPO_DIR/strassen_ompi"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/strassen/src/strassen_ompi_trim.c"
OUTPUT_FILE="$REPO_DIR/strassen_ompi_trim"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/strassen/src/strassen.c"
OUTPUT_FILE="$REPO_DIR/strassen"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/alignment/src/alignment.c"
OUTPUT_FILE="$REPO_DIR/alignment"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/alignment/src/alignment_ompi_trim.c"
OUTPUT_FILE="$REPO_DIR/alignment_ompi_trim"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/alignment/src/alignment_ompi.c"
OUTPUT_FILE="$REPO_DIR/alignment_ompi"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/sparselu/src/sparselu.c"
OUTPUT_FILE="$REPO_DIR/sparselu"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/sparselu/src/sparselu_ompi.c"
OUTPUT_FILE="$REPO_DIR/sparselu_ompi"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/sparselu/src/sparselu_ompi_trim.c"
OUTPUT_FILE="$REPO_DIR/sparselu_ompi_trim"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/knapsack/src -I$REPO_DIR/alignment/src -I$REPO_DIR/floorplan/src -I$REPO_DIR/uts/src -I$REPO_DIR/sparselu/src -I$REPO_DIR/sort/src -I$REPO_DIR/fib/src -I$REPO_DIR/nqueens/src -I$REPO_DIR/concom/src -I$REPO_DIR/fft/src -I$REPO_DIR/strassen/src -I$REPO_DIR/health/src
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

echo "BUILD SUCCESSFUL"
