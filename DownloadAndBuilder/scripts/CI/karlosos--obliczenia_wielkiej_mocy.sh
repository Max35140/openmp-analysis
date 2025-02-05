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

# Compile the first source file
cd "$REPO_DIR/lab_8_ulam_sierpinski_taskwait"
g++ -o trojkat_openmp trojkat_openmp.cpp -fopenmp

# Compile the second source file
cd "$REPO_DIR/lab_9_labirynt_openmp"
g++ -o labirynt_omp labirynt_omp.cpp -fopenmp

echo "BUILD SUCCESSFUL"
