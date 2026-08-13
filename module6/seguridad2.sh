#!/bin/bash

# Control de red de seguridad estricta
set -euo pipefail

# 1. Función de limpieza de emergencia
# Está función cumple el rol de ejecutarse de manera automática cuando el sistema
# operativo captura la señal configurada en el trap.
# Objetivo: Asegurar que si el script es cancelado abruptamente o termina con éxito, elimina cualquier
# rastro de bloqueo que haya sido creado en el sistema.
limpiar_sistema() {

    echo -e "\n🧹 Ejecutando limpieza... Eliminando archivos temporales."

    # Ejecutar un borrado seguro y silencioso.
    rm -f /tmp/bloqueo_script.lock

    # Regla de oro defensiva: En el caso de activar el candado de bloqueo, asegurarnos
    # que la terminal no quede sujeta a algún bloqueo ánomalo.
    stty echoctl
}

# 2. Configuración del trap profesional
# Vincular la función anterior estrictamente a la señal 'EXIT'
# 'EXIT'; es una señal en Bash: se activa SIEMPRE, tanto si el script lleva
# al final con un éxito, como si es interrumpido el flujo por el usuario (INT - CTRL+C) o un error
# fatal (ERR)
trap limpiar_sistema EXIT

# Control visual de la terminal
# El comando 'stty' configura las propiedades sujetas al driver de la terminal.
# Desactivar la opción de control sobre impresiones que contengan lo siguiente: '^C' o '^Z'
stty -echoctl

# 3. Lógica principal del script
echo "Creando archivo de bloqueo..."
touch /tmp/bloqueo_script.lock

echo "El script está trabajando... Presiona CTRL + C para cancelarlo de forma ultra limpia."

# Simulación de una tarea pesada en segundo plano (ej: procesamiento de una bdd o backup).
sleep 10

echo "Script finalizado con éxito."

