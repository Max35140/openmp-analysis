#!/bin/bash

# Sofort beenden, wenn ein Befehl mit einem nicht-null Status endet
set -e

# Überprüfen, ob das Verzeichnis des Repositories übergeben wurde
if [ -z "$1" ]; then
    echo "Usage: $0 <repository-directory>"
    exit 1
fi

# Das Verzeichnis des Repositories aus dem Argument holen
REPO_DIR="$1"

# Liste der Dateien und Ausgabedateien
declare -A files_and_outputs=(
    ["$REPO_DIR/fibonacci.c"]="fibonacci.o"
    ["$REPO_DIR/tasks/task1.cpp"]="task1.o"
    ["$REPO_DIR/tasks/task-data.cpp"]="task-data.o"
    ["$REPO_DIR/tasks/task4.cpp"]="task4.o"
    ["$REPO_DIR/tasks/task3.cpp"]="task3.o"
    ["$REPO_DIR/tasks/task2.cpp"]="task2.o"
)

# Kompilieren jeder Datei
for file in "${!files_and_outputs[@]}"; do
    output=${files_and_outputs[$file]}
    if [[ $file == *.cpp ]]; then
        echo "Compiling $file..."
        g++ -c -o "$output" "$file" -std=c++14 -fopenmp -Wall -Wshadow -pedantic -O2
    else
        echo "Compiling $file..."
        gcc -c -o "$output" "$file" -std=gnu99 -fopenmp -Wall -Wshadow -pedantic -O2
    fi
done

# Ausgabe bei erfolgreichem Build
echo "BUILD SUCCESSFUL"
