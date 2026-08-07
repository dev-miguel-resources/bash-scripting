#!/usr/bin/env bash

# Control de red de seguridad estricta
set -euo pipefail

calcular_descuento() {

    local precio="$1"
    local descuento="$2"
    local total=$(( precio - (precio * descuento / 100) ))

    # $#: almacena el NÚMERO TOTAL de argumentos que recibió esta función.
    # Si no recibió exactamente 2 parámetros (precio y descuento), detenemos el flujo.
    if [[ $# -ne 2 ]]; then
        echo "X [ERROR INTERNO]: La función require exactamente 2 argumentos (precio y porcentaje)."
        return 1 # Código de error
    fi    

    echo "Precio final con descuento aplicado: \$$total CLP."
}

echo "--- 1. Intento correcto ---"
calcular_descuento 10000 15