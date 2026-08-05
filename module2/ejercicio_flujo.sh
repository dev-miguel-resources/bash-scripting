#!/usr/bin/env bash

# Control de red de seguridad estricta
set -euo pipefail

echo "======================================================="
echo "--- CONTROLES DE FLUJO ('continue' y 'break')       ---"
echo "======================================================="

for numero in {1..10}; do
    # Saltar los números impares utilizando 'continue'
    if [[ $((numero % 2)) -ne 0 ]]; then
        continue
    fi

    # Romper el bucle por completo si llegamos al 8 usando 'break'
    if [[ $numero -eq 8 ]]; then
        echo "-> Bucle interrumpido en el $numero de forma abrupta."
        break
    fi

    echo "Procesando número par: $numero"
done

echo "======================================================="
echo "--- MANEJO DE RETORNO EN FUNCIONES ('return')       ---"
echo "======================================================="

echo -e "\n--- Uso de 'return' en funciones ---"
validar_servicio() {
    # return: no devuelve texto, devuelve un código de estado número (0-255)
    local SERVICIO_ACTIVO=0 # Éxito en linux

    if [[ $SERVICIO_ACTIVO -eq 0 ]]; then
        return 0 # OK
    else
        return 1 # Error
    fi
}

# Invocar la función y evaluamos su código de retorno inmediatamente.
if validar_servicio; then
    echo "Resultado: El servicio está operando correctamente."
else
    echo "Resultado: Falla crítica en el servicio."
fi

