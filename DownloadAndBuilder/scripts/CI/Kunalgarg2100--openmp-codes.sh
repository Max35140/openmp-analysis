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
    ["$REPO_DIR/codes/Recursive_2.c"]="Recursive_2.o"
    ["$REPO_DIR/codes/Quicksort_tasks.c"]="Quicksort_tasks.o"
    ["$REPO_DIR/codes/Fib_tasks.c"]="Fib_tasks.o"
    ["$REPO_DIR/codes/Mergesort_tasks.c"]="Mergesort_tasks.o"
    ["$REPO_DIR/codes/PostOrderTraversal_tasks.c"]="PostOrderTraversal_tasks.o"
    ["$REPO_DIR/book/criticalsection-tasks2.c"]="criticalsection-tasks2.o"
    ["$REPO_DIR/book/binsearch-with-limit-on-recursion-depth.c"]="binsearch-with-limit-on-recursion-depth.o"
    ["$REPO_DIR/book/threadprivate.c"]="threadprivate.o"
    ["$REPO_DIR/book/antidependence-dependclause.c"]="antidependence-dependclause.o"
    ["$REPO_DIR/book/untied-task.c"]="untied-task.o"
    ["$REPO_DIR/book/criticalsection-tasks.c"]="criticalsection-tasks.o"
    ["$REPO_DIR/book/finalclasuse.c"]="finalclasuse.o"
    ["$REPO_DIR/book/mergeable.c"]="mergeable.o"
    # Datei überspringen ["$REPO_DIR/book/taskconstruct_process-elements-in-a-linked-list.c"]="taskconstruct_process-elements-in-a-linked-list.o"
    ["$REPO_DIR/book/flowdependence-dependclause.c"]="flowdependence-dependclause.o"
)

# Kompilieren jeder Datei
for file in "${!files_and_outputs[@]}"; do
    output=${files_and_outputs[$file]}
    echo "Compiling $file..."
    gcc -c -o "$output" "$file" -std=gnu99 -fopenmp -Wall -Wshadow -pedantic -O2
done

# Ausgabe bei erfolgreichem Build
echo "BUILD SUCCESSFUL"
