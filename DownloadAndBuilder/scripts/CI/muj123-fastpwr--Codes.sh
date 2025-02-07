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
SRC_FILE1="$REPO_DIR/OpenMp/Summation using openmp tasks.cpp"
SRC_FILE2="$REPO_DIR/OpenMp/Traverse linkList.cpp"
OUTPUT1="Summation_using_openmp_tasks"
OUTPUT2="Traverse_linkList"

# Compile the first source file with OpenMP support
g++ -O0 -std=c++11 -Wall -pedantic -fopenmp -g -march=native -o "$OUTPUT1" "$SRC_FILE1"

# Compile the second source file with OpenMP support
g++ -O0 -std=c++11 -Wall -pedantic -fopenmp -g -march=native -o "$OUTPUT2" "$SRC_FILE2"

echo "BUILD SUCCESSFUL"
