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


SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB134-taskdep5-orig-omp45-yes.c"
OUTPUT_FILE="$REPO_DIR/DRB134-taskdep5-orig-omp45-yes"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB158-missingtaskbarrier-orig-gpu-no.c"
OUTPUT_FILE="$REPO_DIR/DRB158-missingtaskbarrier-orig-gpu-no"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB123-taskundeferred-orig-yes.c"
OUTPUT_FILE="$REPO_DIR/DRB123-taskundeferred-orig-yes"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB107-taskgroup-orig-no.c"
OUTPUT_FILE="$REPO_DIR/DRB107-taskgroup-orig-no"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB079-taskdep3-orig-no.c"
OUTPUT_FILE="$REPO_DIR/DRB079-taskdep3-orig-no"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB117-taskwait-waitonlychild-orig-yes.c"
OUTPUT_FILE="$REPO_DIR/DRB117-taskwait-waitonlychild-orig-yes"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB128-tasking-threadprivate2-orig-no.c"
OUTPUT_FILE="$REPO_DIR/DRB128-tasking-threadprivate2-orig-no"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB133-taskdep5-orig-omp45-no.c"
OUTPUT_FILE="$REPO_DIR/DRB133-taskdep5-orig-omp45-no"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB165-taskdep4-orig-omp50-yes.c"
OUTPUT_FILE="$REPO_DIR/DRB165-taskdep4-orig-omp50-yes"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB177-fib-taskdep-yes.c"
OUTPUT_FILE="$REPO_DIR/DRB177-fib-taskdep-yes"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB176-fib-taskdep-no.c"
OUTPUT_FILE="$REPO_DIR/DRB176-fib-taskdep-no"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB072-taskdep1-orig-no.c"
OUTPUT_FILE="$REPO_DIR/DRB072-taskdep1-orig-no"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB078-taskdep2-orig-no.c"
OUTPUT_FILE="$REPO_DIR/DRB078-taskdep2-orig-no"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB130-mergeable-taskwait-orig-no.c"
OUTPUT_FILE="$REPO_DIR/DRB130-mergeable-taskwait-orig-no"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB167-taskdep4-orig-omp50-no.c"
OUTPUT_FILE="$REPO_DIR/DRB167-taskdep4-orig-omp50-no"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB105-taskwait-orig-no.c"
OUTPUT_FILE="$REPO_DIR/DRB105-taskwait-orig-no"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB122-taskundeferred-orig-no.c"
OUTPUT_FILE="$REPO_DIR/DRB122-taskundeferred-orig-no"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB096-doall2-taskloop-collapse-orig-no.c"
OUTPUT_FILE="$REPO_DIR/DRB096-doall2-taskloop-collapse-orig-no"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB027-taskdependmissing-orig-yes.c"
OUTPUT_FILE="$REPO_DIR/DRB027-taskdependmissing-orig-yes"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB100-task-reference-orig-no.cpp"
OUTPUT_FILE="$REPO_DIR/DRB100-task-reference-orig-no"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB095-doall2-taskloop-orig-yes.c"
OUTPUT_FILE="$REPO_DIR/DRB095-doall2-taskloop-orig-yes"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB175-non-sibling-taskdep2-yes.c"
OUTPUT_FILE="$REPO_DIR/DRB175-non-sibling-taskdep2-yes"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB127-tasking-threadprivate1-orig-no.c"
OUTPUT_FILE="$REPO_DIR/DRB127-tasking-threadprivate1-orig-no"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB106-taskwaitmissing-orig-yes.c"
OUTPUT_FILE="$REPO_DIR/DRB106-taskwaitmissing-orig-yes"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB131-taskdep4-orig-omp45-yes.c"
OUTPUT_FILE="$REPO_DIR/DRB131-taskdep4-orig-omp45-yes"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB135-taskdep-mutexinoutset-orig-no.c"
OUTPUT_FILE="$REPO_DIR/DRB135-taskdep-mutexinoutset-orig-no"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB173-non-sibling-taskdep-yes.c"
OUTPUT_FILE="$REPO_DIR/DRB173-non-sibling-taskdep-yes"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB129-mergeable-taskwait-orig-yes.c"
OUTPUT_FILE="$REPO_DIR/DRB129-mergeable-taskwait-orig-yes"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB132-taskdep4-orig-omp45-no.c"
OUTPUT_FILE="$REPO_DIR/DRB132-taskdep4-orig-omp45-no"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB168-taskdep5-orig-omp50-yes.c"
OUTPUT_FILE="$REPO_DIR/DRB168-taskdep5-orig-omp50-yes"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB174-non-sibling-taskdep-no.c"
OUTPUT_FILE="$REPO_DIR/DRB174-non-sibling-taskdep-no"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB101-task-value-orig-no.cpp"
OUTPUT_FILE="$REPO_DIR/DRB101-task-value-orig-no"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB136-taskdep-mutexinoutset-orig-yes.c"
OUTPUT_FILE="$REPO_DIR/DRB136-taskdep-mutexinoutset-orig-yes"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

SOURCE_FILE="$REPO_DIR/micro-benchmarks/DRB166-taskdep4-orig-omp50-no.c"
OUTPUT_FILE="$REPO_DIR/DRB166-taskdep4-orig-omp50-no"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Fehler: Quelldatei $SOURCE_FILE nicht gefunden!"
    exit 1
fi

echo "Kompiliere: $SOURCE_FILE..."
g++ -o "$OUTPUT_FILE" "$SOURCE_FILE" -fopenmp -I$REPO_DIR/micro-benchmarks-fortran/polybench -I$REPO_DIR/micro-benchmarks/utilities -I$REPO_DIR/micro-benchmarks -I$REPO_DIR/micro-benchmarks-fortran/utilities -I$REPO_DIR/micro-benchmarks/polybench
echo "Erfolgreich kompiliert: $OUTPUT_FILE"

echo "BUILD SUCCESSFUL"
