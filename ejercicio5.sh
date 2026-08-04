#!/usr/bin/env bash

# Activar el modo estricto
set -euo pipefail

echo "======================================================="
echo "--- 1: ARRAYS INDEXADOS EN BASH ---"
echo "======================================================="

# Crear una lista indexada (0,1,2....)
tecnologias=("Docker" "WSL" "Bash" "Linux")

# Para llamar a un elemento específico, usamos referencia de corchetes. El conteo inicia en 0.
echo "Elemento en el indice 1: ${tecnologias[1]}"

# Para mostrar TODOS sus elementos.
# El símbolo '@' o '*' expande la lista para mostrar todos los elementos.
echo "Lista completa de tecnologías: ${tecnologias[*]}"

# Anteponer el signo '#' antes del nombre del array para que nos devuelva la cantidad total de elementos
echo "Total de elementos en la lista: ${#tecnologias[@]}"

echo "========================================================="
echo "--- 2: ARRAYS ASOCIATIVOS (DICCIONARIOS CLAVE-VALOR) --- "
echo "========================================================="

# IMPORTANTE: los arrays asociativos requiren obligatoriamente ser declarados con 'declare -A'.
declare -A alumno

# En lugar de números, usamos cadenas de texto fijas como índices (claves).
# definiciones de llave valor
alumno[nombre]="Andrés"
alumno[nota]="7"
alumno[estado]="aprobado"

echo "El alumno ${alumno[nombre]} obtuvo una nota final de ${alumno[nota]}".

echo "=============================================================="
echo "--- 3: PARAMETER EXTENSION (MANIPULACIÓN NATIVA AL VUELO) --- "
echo "=============================================================="

# Rescatar el valor del diccionario
ESTADO_ACTUAL=${alumno[estado]}
echo "Texto original leído: $ESTADO_ACTUAL"

# 1. Pasar a Mayúsculas completas usando '^^'
echo "Modificador ^^ (Mayúsculas): ${ESTADO_ACTUAL^^}"

# 2. Extraer una subcadena.
# Extaer desde la posición 0 los primeros 4 caracteres.
echo "Recortar texto (Subcadena): ${ESTADO_ACTUAL:0:4}"

# 3. Manejo de valores por defecto
# Si la variable ':-' no existe o está vacía, Bash inyectará el valor de la derecha
# de forma automática sin abortar el script, actuando como un plan alternativo.

echo "Verificación de asistencia: ${ASISTENCIA_ALUMNO:-'100% obligatoria'}"