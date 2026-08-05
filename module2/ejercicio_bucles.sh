#!/usr/bin/env bash

# Control de red de seguridad estricta
set -euo pipefail

echo "=================================================================="
echo "--- 1. DEFINICIÓN DE BUCLE FOR (Iterar sobre listas o rangos)  ---"
echo "=================================================================="
# Sintaxis de evaluación sobre rangos: {}
for i in {1..5}; do
    echo "Servidor número: $i"
done

echo "=================================================================================="
echo "--- 2. DEFINICIÓN DE BUCLE WHILE (Monitoreo basado en condiciones verdaderas)  ---"
echo "=================================================================================="

CONTADOR=3
while [[ $CONTADOR -gt 0 ]]; do
    echo "Intentos restantes de conexión: $CONTADOR"
    CONTADOR=$((CONTADOR - 1))
done

echo "==================================================================================="
echo "--- 3. DEFINICIÓN DE BUCLE UNTIL (SE EJECUTA HASTA QUE LA CONDICIÓN SE CUMPLA)  ---"
echo "==================================================================================="
# Es el opuesto exacto a 'while'. Corre mientras la condición sea FALSA.
PUERTO_ABIERTO="NO"
INTENTO=1

until [[ $PUERTO_ABIERTO == "SI" ]]; do
    echo "Validando puerto... Intento $INTENTO"
    if [[ $INTENTO -eq 2 ]]; then
        PUERTO_ABIERTO="SI"
    fi
    INTENTO=$((INTENTO + 1))
done
echo "¡Puerto detectado con éxito!"