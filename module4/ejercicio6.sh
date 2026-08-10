#!/usr/bin/env bash

# Control de red de seguridad estricta
set -euo pipefail

cd /var/log/respaldos || exit 1

# Si la carpeta no existe, de todas maneras se genera una eliminación recursiva sobre todos los elementos de la carpeta actual.
# rm -rf -i ./* (permisos de usuario)
# rm -rf -i -- * (permisos de usuario)
# rm -rf ./*
# rm -rf -- *
rm -rf -i ./*