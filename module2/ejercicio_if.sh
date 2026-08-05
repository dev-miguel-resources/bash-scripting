#!/usr/bin/env bash

# Control de red de seguridad estricta
set -euo pipefail

echo "======================================================="
echo "--- DEFINICIÓN DE VARIABLES ---"
echo "======================================================="

EDAD=18
MEMORIA_DISPONIBLE=2048

echo "======================================================="
echo "--- 1. CONDICIONALES MODERNOS CON [[ ]] ---"
echo "======================================================="
# DEFINICIONES:
# [[ ]] -> definición nativa de Bash para condicionales.
# -ge -> Significa "Greather than or equal (Mayor o igual a)". Se usa para números.
# -gt -> Significa "Grether than (Mayor que)". Se usa para números.
# && -> Operador lógica AND (Y). Exige que ambas condiciones sean verdaderas a la vez.
# -lt -> Significa "Less than (Menor que)".

if [[ $EDAD -ge 18 && $MEMORIA_DISPONIBLE -gt 3000 ]]; then
    # Este bloque se ejecuta SOLAMENTE si se cumplen las 2 premisas anteriores.
    echo "Estado: Cumple con la edad y el servidor tiene suficiente RAM."
# continuar con otras evaluaciones.
elif [[ $EDAD -lt 18 ]]; then
    echo "Estado: Menor de edad."
# terminar con la condición negativa (bloque de descarte).
# se ejecuta si ninguna de las condiciones de mas arriba fue verdadera.
else 
    echo "Estado: Ejecución bloque de descarte."
fi

echo "======================================================="
echo "--- 2. OPERADORES DE ARCHIVOS Y MANEJO DE ESPACIOS  ---"
echo "======================================================="

# Definir una variable con una cadena que contiene espacios en blanco.
ARCHIVO_CON_ESPACIOS="mi reporte mensual.txt"

# DEFINICIONES:
# 'f' -> evalúa si lo que está a su derecha cumpla con las siguientes 2 condiciones:
# 1. Que el elementa EXISTA en la raíz donde hagamos la evaluación.
# 2. Que sea un archivo regular (texto, imagen, script), NO una carpeta.
if [[ -f $ARCHIVO_CON_ESPACIOS ]]; then
    echo "El archivo existe en la ruta especificada."
else
    # El script entra aquí porque el archivo "mi reporte mensual.txt" no ha sido creado en esa carpeta.
    echo "Archivo '$ARCHIVO_CON_ESPACIOS' no encontrado."
fi