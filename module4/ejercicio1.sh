#!/usr/bin/env bash

# Control de red de seguridad estricta
set -euo pipefail

# objetivo: queremos mantener esto como una cadena y analicemos la eliminación.
# corrección: agregar la comilla doble para que maneje ARCHIVOS como una sola cadena de valor.
# rm "$ARCHIVOS"
readonly ARCHIVOS="foto 1.jpg foto 2.jpg"
rm $ARCHIVOS
