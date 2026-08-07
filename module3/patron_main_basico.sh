#!/usr/bin/env bash

# Control de red de seguridad estricta
set -euo pipefail

# 1. Definición de función secundaria.
mostrar_bienvenida() {
    echo "Iniciando sistema de automatización corporativa..."
}

# 2. Definición de función principal 'main'.
# Centralizar toda la orquestación del script. Es el cerebro del programa.
# main: reservado este nombre.
# archivo -> main() -> invoca el programa.
main() {
    mostrar_bienvenida
    echo "Ejecutando tareas críticas del bloque central."
}

# 3. Disparador único (Trigger).
# Esta es la única linea suelta al final del archivo que da inicio a todo el programa.
main