#!/usr/bin/env bash

# Control de red de seguridad estricta
set -euo pipefail

# 1. Funciones secundarias
procesar_datos() {
    # Crear una variable local como argumento llamada archivo
    local archivo="$1"
    echo "[PROCESANDO]: Analizando el archivo log -> $archivo"
}

# 2. Función principal 'main'
main() {
    # Validar si el usuario pasó el parámetro al ejecutar el script general
    if [[ $# -lt 1 ]]; then
        # $0 -> al script actual de ejecución.
        # <> -> segurencia de valor.
        echo "Uso: bash $0 <nombre_archivo.log>"
        exit 1
    fi

    local archivo_objetivo="$1"
    procesar_datos "$archivo_objetivo"
}

# DISPARADOR AVANZADO:
# Usar "$@" para capturar todos los parámetros que el usuario escribió en la terminal
# para enviarlos a la ejecución de la función main.
main "$@"
