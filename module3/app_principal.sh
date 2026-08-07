#!/usr/bin/env bash

# Control de red de seguridad estricta
set -euo pipefail

echo "--- Importando librería externa ---"
# El comando 'source' y el comando '.', esto lee el archivo indicado
# e inyecta todas sus funciones directamente en la memoria de este script.
source ./herramientas.sh

echo "--- Utilizando funciones de la librería ---"
# Invocar la función que vive dentro de herramientas.sh
AHORA=$(obtener_fecha_formato)
echo "La marca de tiempo de la librería es: $AHORA"

MENSAJE=$(convertir_mayusculas "curso de bash scripting")
echo "Texto transformado: $MENSAJE"