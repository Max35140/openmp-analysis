#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Check if the source file path is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <source-file-path>"
    exit 1
fi

# Get the source file path from the argument
SRC_FILE="$1"

# Define the output object file
OUTPUT_FILE="${SRC_FILE%.cpp}.o"

# Compile the source file to an object file using g++
g++ -O0 -std=c++11 -Wall -pedantic -fopenmp -g -c "$SRC_FILE" -o "$OUTPUT_FILE"

echo "BUILD SUCCESSFUL"
