#!/usr/bin/env bash

# Control de red de seguridad estricta
set -euo pipefail

declare -i VALOR=10

calcular() {
    local VALOR=42
    echo "$VALOR"
}

echo "$VALOR"

calcular