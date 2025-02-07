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

# Navigate to the directory containing the Makefile
cd "$REPO_DIR/TP3/TP3/Fichiers"

# Clean previous builds, ignoring errors for missing files
make clean || true

# Build the project using the Makefile
make

echo "BUILD SUCCESSFUL"
