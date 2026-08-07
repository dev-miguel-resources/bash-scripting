#!/usr/bin/env bash

# Control de red de seguridad estricta
set -euo pipefail

PROCESO="Copia_Seguridad"

modificar_sistema() {
    # PROCESO="Limpieza_Temporales"
    local PROCESO="Limpieza_Temporales"
    echo "Dentro de la función: PROCESO vale -> $PROCESO"
}

echo "Antes de ejecutar la función, el proceso global es: $PROCESO" # Copia_Seguridad
modificar_sistema # Limpieza_Temporales
echo "Después de ejecutar la función, el proceso global AHORA es: $PROCESO" # Copia_Seguridad