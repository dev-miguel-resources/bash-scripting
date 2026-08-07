#!/usr/bin/env bash

# Control de red de seguridad estricta
set -euo pipefail

# En bash los paréntesis () en la definición de una función siempre están vacíos.
# Los datos no se declaran ahí; se reciben de forma posicional ($1, $2, $3) al invocarla.
saludar_usuario() {
    # Asignación de parámetros
    local nombre="$1"
    local rol="$2"

    echo "Hola, $nombre. Has iniciado sesión con el rol de: [$rol]."
}

echo "--- 1. Invocando función con parámetros ---"
saludar_usuario "Juan Pepito" "Administrador"
saludar_usuario "Russell Pepito" "Devops"  