#!/usr/bin/env bash

echo "======================================================="
echo "--- 1: BASH MODERNO Y STRICT MODE (MODO ESTRICTO) ---  "
echo "======================================================="

# Activar el modo estricto
set -euo pipefail

# (IFS: Internal Field Separator) Definir un delimitador de campos.
IFS=','

echo "======================================================="
echo "--- 2: VARIABLES: TIPOS, ALCANCE (SCOPE) Y ENTORNO --- "
echo "======================================================="

declare -i EDAD=30
declare -r PAIS="Chile"

# Te permite disponibilizar el valor de una variable de manera transversal hacia otros archivos
# que la necesiten
export CURSO_ENTORNO="Bash Nivel Pro"

bash script_hijo.sh # Ejecutamos otro script

# Definición de una función para demostrar el alcance (Scope)
funcion_demo() {
    local ROL="Administrador"
    echo "Dentro de la función: El rol detectado es [ $ROL ]"
}

# Invocamos la función
funcion_demo

echo "======================================================="
echo "--- 3: QUOTING (COMILLAS SIMPLES, DOBLES Y ESCAPE) --- "
echo "======================================================="

PRECIO=500

echo 'Comillas Simples: El precio es $PRECIO (Muestra el texto literal sin evaluar)'.

echo "Comillas Dobles: El precio real es $PRECIO (Evalúa y expande el valor)".

echo "Carácter de Escape: El costo total es de \$${PRECIO} CLP."

echo "======================================================="
echo "--- 4: ARRAYS INDEXADOS                            --- "
echo "======================================================="

servidores=("srv-web" "srv-db" "srv-cache")
# Al llamar un array sin espeficar indice, Bash por defecto extrae el primer elemento
echo "Primer servidor detectado (indice 0): ${servidores[0]}"

# Necesito expandir todos y cada uno de los elementos contenidos en la lista.
echo "Lista completa de infraestructura: ${servidores[*]}"

echo "======================================================="
echo "--- 4: ARRAYS ASOCIATIVOS (EXCLUSIVO DE BASH 4.0+) --- "
echo "======================================================="

declare -A configuracion
configuracion[puerto]="8080"
configuracion[usuario]="root"
configuracion[estado]="activo"

# Extraer un valor apuntando a su llave
echo "El puerto de escucha en producción es: ${configuracion[puerto]}"

echo "======================================================="
echo "--- 5: PARAMETER EXTENSION (MANIPULACIÓN NATIVA)    ---"
echo "======================================================="

ESTADO_MIN=${configuracion[estado]}
echo "Estado original (Leído del array): $ESTADO_MIN"

echo "Transformación limpia a Mayúsculas: ${ESTADO_MIN^^}"

CONVERTIDO_MIN="${ESTADO_MIN^^}"
echo "Transformación limpia a mayúsculas: ${CONVERTIDO_MIN^^}"
echo "Transformación limpia a minúsculas: ${CONVERTIDO_MIN,}"
echo "Transformación limpia a minúsculas: ${CONVERTIDO_MIN,,}"
echo "Transformación limpia a solo la primera en mayúscula: ${CONVERTIDO_MIN^}"

echo "Validación de contingencia: Base de Datos activa -> ${DB_NAME:-'produccion_default'}"





