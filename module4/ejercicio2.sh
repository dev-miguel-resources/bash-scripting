#!/usr/bin/env bash

# Control de red de seguridad estricta
set -euo pipefail

# Objetivo: manejarlo como una lista y con 2 valores: foto 1.jpg y foto 2.jpg
readonly ARCHIVOS=("foto 1.jpg" "foto 2.jpg")

# Necesitamos eliminar todo de archivos.
rm "${ARCHIVOS[@]}"

echo "$ARCHIVOS"