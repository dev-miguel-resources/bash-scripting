#!/usr/bin/env bash

# Control de red de seguridad estricta
set -euo pipefail

CORREO="ing@gmail.com"

if [[ $CORREO == *@* ]]; then
    echo $CORREO
    echo "Válido"
fi