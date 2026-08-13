#!/bin/bash

# Control de red de seguridad estricta
set -euo pipefail

# Objetivo: Crear un script que diferencia la gravedad de eventos (INFO, WARNING, ERROR) guardándolos
# con marcas de tiempo en un archivo de bitácora.  

# 1. Definición de archivo de destino (Bitácora)
readonly LOG_FILE="auditoria.log"

# 2. Función para centralizar logs (Gestor de registros)
log_mensaje() {
    # parámetros dinámicas: nivel y mensaje
    local nivel="$1"
    local mensaje="$2"

    printf "[%s] [%s] %s\n" "$(date '+%Y-%m-%d %H:%M:%S')" "$nivel" "$mensaje" >> "$LOG_FILE"
}

# 3. Caso de prueba: Simular eventos de un servidor de producción.
# Nivel INFO: Registro de operaciones comunes, exitosas o rutinarias.
log_mensaje "INFO" "Iniciando el proceso de respaldo automatizado."

# Nivel WARN (Warning): Advertencias que no detienen el sistema, pero requieren atención preventiva.
log_mensaje "WARN" "El espacio en disco está superando el 80%."

# Nivel ERROR: Fallos críticos que detuvieron una tarea o afectaron la disponibilidad de un servicio.
log_mensaje "ERROR" "No se pudo conectar al servidor remoto."

# 4. Exponer la auditoria visual en la terminal
echo "Se han registrado 3 eventos estructurados en '$LOG_FILE'."

# Leer el archivo final usando 'cat' para comprobar las 3 líneas que se debieron de guardar.
cat "$LOG_FILE"

