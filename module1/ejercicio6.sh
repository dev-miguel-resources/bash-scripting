#!/usr/bin/env bash

# Activar el modo estricto
set -euo pipefail

echo "======================================================="
echo "--- 1: ARRAYS ASOCIATIVOS ---"
echo "======================================================="

echo -e "\n--- Arreglo asociativo ---"

declare -A puertos

# Asignación compuesta usando [clave]=valor
puertos=([http]=80 [https]=443 [ssh]=22)

# Añadir o modificar una clave individual
puertos[ftp]=21

# Acceder a un valor específico usando su clave
echo "El puerto seguro de navegación es: ${puertos[https]}"

# Recorrer las CLAVES (usar el signo !)
for servicio in "${!puertos[@]}"; do
    echo "Servicio: $servicio -> Puerto: ${puertos[$servicio]}"
done