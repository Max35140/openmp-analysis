#!/bin/bash
set -e  # Sofortiges Beenden bei Fehlern

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Prüfen, ob $1 ein absoluter Pfad ist
if [[ "$1" == /* ]]; then
    REPO_DIR="$1"
else
    REPO_DIR="$(cd "$SCRIPT_DIR/../../$1" && pwd)"
fi

if [ ! -d "$REPO_DIR" ]; then
    echo "Fehler: Das Repository-Verzeichnis existiert nicht!"
    exit 1
fi


SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/target-25.c"
OUTPUT_FILE="$REPO_DIR/target-25"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/depend-1.c"
OUTPUT_FILE="$REPO_DIR/depend-1"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/task-4.c"
OUTPUT_FILE="$REPO_DIR/task-4"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/depend-5.c"
OUTPUT_FILE="$REPO_DIR/depend-5"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/target-27.c"
OUTPUT_FILE="$REPO_DIR/target-27"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/taskloop-2.c"
OUTPUT_FILE="$REPO_DIR/taskloop-2"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/pr39591-3.c"
OUTPUT_FILE="$REPO_DIR/pr39591-3"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/pr36802-1.c"
OUTPUT_FILE="$REPO_DIR/pr36802-1"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/pr70680-2.c"
OUTPUT_FILE="$REPO_DIR/pr70680-2"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/cancel-taskgroup-1.c"
OUTPUT_FILE="$REPO_DIR/cancel-taskgroup-1"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/pr70680-1.c"
OUTPUT_FILE="$REPO_DIR/pr70680-1"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/cancel-parallel-2.c"
OUTPUT_FILE="$REPO_DIR/cancel-parallel-2"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/icv-1.c"
OUTPUT_FILE="$REPO_DIR/icv-1"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/pr80809-1.c"
OUTPUT_FILE="$REPO_DIR/pr80809-1"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/depend-4.c"
OUTPUT_FILE="$REPO_DIR/depend-4"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/pr66133.c"
OUTPUT_FILE="$REPO_DIR/pr66133"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/lock-2.c"
OUTPUT_FILE="$REPO_DIR/lock-2"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/priority.c"
OUTPUT_FILE="$REPO_DIR/priority"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/pr39591-2.c"
OUTPUT_FILE="$REPO_DIR/pr39591-2"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/task-3.c"
OUTPUT_FILE="$REPO_DIR/task-3"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/target-33.c"
OUTPUT_FILE="$REPO_DIR/target-33"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/task-1.c"
OUTPUT_FILE="$REPO_DIR/task-1"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/nqueens-1.c"
OUTPUT_FILE="$REPO_DIR/nqueens-1"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/pr80809-3.c"
OUTPUT_FILE="$REPO_DIR/pr80809-3"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/pr68960.c"
OUTPUT_FILE="$REPO_DIR/pr68960"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/pr80809-2.c"
OUTPUT_FILE="$REPO_DIR/pr80809-2"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/taskgroup-1.c"
OUTPUT_FILE="$REPO_DIR/taskgroup-1"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/pr61200.c"
OUTPUT_FILE="$REPO_DIR/pr61200"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/taskloop-1.c"
OUTPUT_FILE="$REPO_DIR/taskloop-1"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/depend-2.c"
OUTPUT_FILE="$REPO_DIR/depend-2"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/depend-3.c"
OUTPUT_FILE="$REPO_DIR/depend-3"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/target-34.c"
OUTPUT_FILE="$REPO_DIR/target-34"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/pr80394.c"
OUTPUT_FILE="$REPO_DIR/pr80394"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/task-5.c"
OUTPUT_FILE="$REPO_DIR/task-5"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/pr39591-1.c"
OUTPUT_FILE="$REPO_DIR/pr39591-1"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/task-2.c"
OUTPUT_FILE="$REPO_DIR/task-2"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/pr79940.c"
OUTPUT_FILE="$REPO_DIR/pr79940"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/sort-1.c"
OUTPUT_FILE="$REPO_DIR/sort-1"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/target-32.c"
OUTPUT_FILE="$REPO_DIR/target-32"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/taskloop-4.c"
OUTPUT_FILE="$REPO_DIR/taskloop-4"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/taskloop-3.c"
OUTPUT_FILE="$REPO_DIR/taskloop-3"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/cancel-taskgroup-2.c"
OUTPUT_FILE="$REPO_DIR/cancel-taskgroup-2"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/examples-4/task_dep-1.c"
OUTPUT_FILE="$REPO_DIR/task_dep-1"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/examples-4/async_target-2.c"
OUTPUT_FILE="$REPO_DIR/async_target-2"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/examples-4/task_dep-4.c"
OUTPUT_FILE="$REPO_DIR/task_dep-4"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/examples-4/task_dep-3.c"
OUTPUT_FILE="$REPO_DIR/task_dep-3"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/examples-4/task_dep-2.c"
OUTPUT_FILE="$REPO_DIR/task_dep-2"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/testsuite/libgomp.c/examples-4/task_dep-5.c"
OUTPUT_FILE="$REPO_DIR/task_dep-5"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
gcc -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

echo "BUILD SUCCESSFUL"
