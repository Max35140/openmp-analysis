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

# Define the source files and the output binaries
SRC_FILES=(
    "$REPO_DIR/omp-merge-sort.c"
    "$REPO_DIR/omp-bintree-walk.c"
)
OUTPUT_FILES=(
    "omp_merge_sort"
    "omp_bintree_walk"
)

# Compile each source file with OpenMP support
for i in "${!SRC_FILES[@]}";
do
    gcc -O0 -std=c99 -Wall -pedantic -fopenmp -g -o "${OUTPUT_FILES[i]}" "${SRC_FILES[i]}"
done

echo "BUILD SUCCESSFUL"
