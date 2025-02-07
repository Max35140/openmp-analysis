#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Check if the repository directory argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <repository-directory>"
    exit 1
fi

# Check if the TAMPI_HOME or TAMPI_INCLUDE_PATH is provided
if [ -z "$2" ]; then
    echo "Usage: $0 <repository-directory> <tampi-home-or-include-path>"
    exit 1
fi

# Get the repository directory from the argument
REPO_DIR="$1"

# Get the TAMPI_HOME or TAMPI_INCLUDE_PATH from the argument
TAMPI_PATH="$2"

# Export the TAMPI_HOME or TAMPI_INCLUDE_PATH variable
export TAMPI_HOME="$TAMPI_PATH"
# If TAMPI_INCLUDE_PATH is preferred, use the following line instead:
# export TAMPI_INCLUDE_PATH="$TAMPI_PATH"

# Define the directory containing the Makefile
MAKEFILE_DIR="$REPO_DIR/tests"

# Change to the directory containing the Makefile
cd "$MAKEFILE_DIR"

# Run make to build the project
make

echo "BUILD SUCCESSFUL"
