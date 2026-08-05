#!/usr/bin/env bash

# Control de red de seguridad estricta
# Desactivamos momentáneamente la bandera 'e' del modo estricto de forma intencional.
# Si la dejamos activa, el script se congelaría y moriría al detectar el primer error,
# impidiéndonos capturar y evaluar manualmente los códigos de salida de los comandos.
set -uo pipefail

echo "==========================================================================="
echo "--- 1. EVALUACIÓN DE CÓDIGOS DE SALIDA (EXIT CODES) Y LA VARIABLE '$?' --- "
echo "==========================================================================="

# DEFINICIONES EN LINUX/UNIX:
# Cuando un código termina con éxito, le devuelve un '0' al sistema operativo.
# Si el comando falla por cualquier motivo, devuelve un número entre 1 y 255.

# Intentamos listar una ruta que NO existe en el sistema. Esto va a fallar.
# '2> /dev/null' silencia el mensaje de error original de la consola para mantenerla limpia.
# '|| false' obliga a que si el comanda falla, el flujo devuelve un estado fallido (1).
ls /ruta/falsa/inexistente 2> /dev/null || false

# LA VARIABLE MÁGICA: '$?':
# Almacena de forma temporal el código número de salida del ÚLTIMO comando ejecutado.
# Debemos guardarla siempre en una variable, porque cuando detecte algún nuevo comando esta se borra.
CODIGO_SALIDA=$?

echo "El comando anterior falló. El sistema operativo registró el código de salida: $CODIGO_SALIDA"

echo "==========================================================================="
echo "--- 2. OPERADORES DE ENCADENAMIENTO LÓGICO (&& Y ||)                    ---"
echo "==========================================================================="

# Estos operadores permiten tomar decisiones rápidas en una sola linea de código,
# actuando como una estructura 'if/else' miniaturizado.

echo "--- CASO A: El operador de éxito (&&) ---"

# OPERADOR && (AND): Ejecuta el comando de la derecha SOLAMENTE si el e la izquierda terminó con éxito (0).
# Si el de la izquierda falla, el de la derecha se ignora (cortocircuito).
mkdir -p "temporal_clase" && echo "(OK) Carpeta creada con éxito."

echo -e "\n--- CASO B: El operador de respaldo o de fallo (||) ---"
# OPERADOR || (OR): Ejecuta el comando de la derecha SOLAMENTE si el de la izquierda falló (1-255).
# Si el operador de la izquierda tiene éxito, el de la derecha se ignora por completo.

rmdir "carpeta_que_no_existe" 2> /dev/null || echo "X No se puede borrar porque no existe ese directorio."

