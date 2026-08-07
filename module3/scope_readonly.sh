#!/usr/bin/env bash

# Control de red de seguridad estricta
set -euo pipefail

readonly PUERTO_SERVER=90

configurar_entorno() {
    # definir una variable local de solo lectura
    local -r PUERTO_SEGURO=443
    echo "Puerto configurado con éxito: $PUERTO_SEGURO"
    # PUERTO_SEGURO=80
}

# Invocamos la función
configurar_entorno

echo "Puerto server: $PUERTO_SERVER"