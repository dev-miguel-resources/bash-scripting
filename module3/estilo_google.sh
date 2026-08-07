#!/usr/bin/env bash

# Control de red de seguridad estricta
set -euo pipefail

# REGLA GOOGLE: Las variables globales del sistema deben escribirse como constantes,
# considerar dejarlas como readonly y ser escritas estrictamente MAYÚSCULAS.
readonly VERSION_SISTEMA="1.5.2"
readonly RUTA_LOGS="/var/log/app"

# REGLA GOOGLE: Nombres de funciones se sugiere que sean definidos en minúsculas separadas por guión bajo.
guardar_registro() {
    # REGLA GOOGLE: Toda variable dentro de una función DEBE ser local, escrita en minúscula y si
    # es más de una palabra separarlas con guión bajo.
    local mensaje_log="$1"
    local mensaje_log2="$2"

    echo "[VERSION_SISTEMA] Grabando en ruta $RUTA_LOGS: $mensaje_log $mensaje_log2"
}

main() {
    guardar_registro "Error de conexión en base de datos" "error de conexión de servidor"
}

# Invocar main
main