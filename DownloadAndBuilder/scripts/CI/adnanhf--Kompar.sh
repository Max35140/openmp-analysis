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
SRC_FILE="$REPO_DIR/DTubes Paralel.c"
OUTPUT="DTubes_Paralel"

# Compile the source file with OpenMP support and link with math library
gcc -O0 -std=c99 -Wall -pedantic -fopenmp -g -march=native -o "$OUTPUT" "$SRC_FILE" -lm

echo "BUILD SUCCESSFUL"
