#!/bin/bash

set -x # Activa el rastreo de lineas en tiempo real

echo "Iniciando análisis de variables..."
USUARIO="profesor"
CONTADOR=5

if [[ "$CONTADOR" -gt 3 ]]; then
    echo "Hola $USUARIO, el contador es mayor a 3."
fi

set +x # Desactivamos el rastro de líneas
echo "Depuración finalizada de forma limpia."