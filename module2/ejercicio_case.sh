#!/usr/bin/env bash

# Control de red de seguridad estricta
set -euo pipefail

echo "======================================================="
echo "--- DEFINICIÓN DE VARIABLES ---"
echo "======================================================="

ACCION="reiniciar"

echo "======================================================="
echo "--- DEFINICIÓN DE CASES ---"
echo "======================================================="

echo "--- Procesando acción del sistema ---"
case "$ACCION" in
        "iniciar" | "start")
            echo "Lanzando servicios en segundo plano..."
            ;;
        "detener" | "stop")
            echo "Apagando servicios de forma segura..."
            ;;
        "reiniciar" | "restart")
            echo "Ejecutando ciclo de reinicio de infraestructura..."
            ;;
        *)
            # El asterisco (*) actua como el 'default' para capturar cualquier otra cosa.
            echo "Opción inválida. Usa: iniciar|detener|reiniciar."
            exit 1
            ;;
esac
