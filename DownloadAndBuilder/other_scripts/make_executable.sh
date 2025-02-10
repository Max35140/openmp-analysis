#!/bin/bash

# Pfad zum Ordner, in dem sich die Buildscripte befinden
directory="/home/max/Downloads/openmp-analysis/DownloadAndBuilder/scripts/CI"

# Durchläuft alle Dateien im Verzeichnis
for file in "$directory"/*; do
    # Überprüft, ob die Datei ein reguläres Datei und keine versteckte Datei ist
    if [ -f "$file" ]; then
        # Macht die Datei mit sudo ausführbar
        sudo chmod +x "$file"
        echo "Datei ausführbar gemacht: $file"
    fi
done

echo "Alle Dateien im Verzeichnis sind nun ausführbar."
