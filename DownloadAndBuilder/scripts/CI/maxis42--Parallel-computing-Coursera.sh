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
SRC_FILE="$REPO_DIR/1 OpenMP/Week 3/3.3_list_par_task/3.3_list_par_task/main.cpp"
OUTPUT="main"

# Compile the source file with OpenMP support
gcc -o $OUTPUT "$SRC_FILE" -fopenmp -g -O3 -Wall -std=c++11 -march=native -fPIE

echo "BUILD SUCCESSFUL"
