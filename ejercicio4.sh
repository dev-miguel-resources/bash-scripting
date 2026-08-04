#!/usr/bin/env bash

# Activar el modo estricto
set -euo pipefail

echo "======================================================="
echo "--- 1: COMILLAS SIMPLES (') VS COMILLAS DOBLES (\") ---"
echo "======================================================="

SISTEMA="Linux Ubuntu"

# COMILLAS SIMPLES: Literalidad absoluta.
# Desactivan la expansión. Bash no lee lo que hay dentro de la variable; solo imprime el texto plano.
echo 'Comillas Simples: Estoy aprendiendo $SISTEMA'

# COMILLAS DOBLES: Es el estándar
# Protegen los espacios, pero permiten que Bash mire dentro e interprete las variables
echo "Comillas Dobles: Estoy aprendiendo $SISTEMA"

echo "===================================================================="
echo "--- 2: EL PELIGRO DE LOS ESPACIOS (POR QUÉ USAR COMILLAS DOBLES) ---"
echo "===================================================================="

# Imaginemos que queremos crear un directorio cuyo nombre contiene espacios.
NOMBRE_CARPETA="Curso Bash Moderno"

echo "Si tus alumnos ejecutan: mkdir \$NOMBRE_CARPETA"
echo "-> Bash interpretará TRES argumentos separados y creará 3 carpetas:"
echo " 1) Curso 2) Bash 3) Moderno"
echo ""
echo "Si ejecutan: mkdir \"\$NOMBRE_CARPETA\""
echo "-> Las comillas dobles fuerzan a Bash a tratar todo como un SOLO bloque de texto."