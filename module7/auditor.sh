#!/bin/bash

mostrar_ayuda() {
    echo "Uso: ./auditor.sh [OPCIONES]"
    echo "Opciones:"
    echo "  -h, --help    Muestra este menú de ayuda estructurado."
    echo "  -i, --ip      Especifica la IP del servidor de destino."
    exit 0
}

# Interceptamos si el usuario escribe -h o --help antes de procesar nada
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    mostrar_ayuda
fi