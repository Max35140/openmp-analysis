#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Check if the repository directory argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <repository-directory>"
    exit 1
fi

# Get the repository directory from the argument
REPO_DIR="$1"

# Define the source file and the output binary
SRC_FILE="$REPO_DIR/TSP.cpp"
OUTPUT="TSP"

# Create a temporary directory and file for modified source code
TMP_DIR=$(mktemp -d)
TMP_SRC_FILE="$TMP_DIR/TSP.cpp"

# Function to clean up temporary directory on exit
cleanup() {
    rm -rf "$TMP_DIR"
}
trap cleanup EXIT

# Add necessary includes, variable declarations, and a main function if not present in TSP.cpp
INCLUDES="#include <stdio.h>\n#include <stdlib.h>\n#include <math.h>\n"
VARIABLES="#define MAXIMAL 100\nint no_cities = 10;\nfloat tmp_min = 1e9;\nfloat m[MAXIMAL*MAXIMAL];\n"
MAIN_FUNCTION="\nint main() {\n    // Example main function\n    no_cities = 5;\n    #pragma omp parallel\n    #pragma omp single\n    rek(0, 0, 0.0, 0);\n    return 0;\n}\n"

# Copy the original file to the temporary file and add includes, variables, and a main function at the end
echo -e "$INCLUDES$VARIABLES" > "$TMP_SRC_FILE"
cat "$SRC_FILE" >> "$TMP_SRC_FILE"
echo -e "$MAIN_FUNCTION" >> "$TMP_SRC_FILE"

# Compile the modified source file with OpenMP support
g++ -O0 -std=c++11 -Wall -pedantic -fopenmp -g -march=native -o "$OUTPUT" "$TMP_SRC_FILE"

echo "BUILD SUCCESSFUL"
