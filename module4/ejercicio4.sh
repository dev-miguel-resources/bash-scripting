#!/usr/bin/env bash

# Control de red de seguridad estricta
set -euo pipefail

for archivo in *.txt; do
    cat "$archivo"
done
