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
SRC_FILE1="$REPO_DIR/task_2/sj2_template_x.cpp"
SRC_FILE2="$REPO_DIR/task_1/version_1.cpp"

# Compile the first source file with OpenMP support
g++ -O0 -std=c++11 -Wall -pedantic -fopenmp -g -march=native -o sj2_template_x "$SRC_FILE1"

# Compile the second source file with OpenMP support
g++ -O0 -std=c++11 -Wall -pedantic -fopenmp -g -march=native -o version_1 "$SRC_FILE2"

echo "BUILD SUCCESSFUL"
