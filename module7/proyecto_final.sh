#!/bin/bash

# ===========================================================================
# SCRIPT: proyecto_final.sh
# MÓDULO VII: Proyecto Final de Mantenibilidad y Seguridad
# AUTOR: Profesor Miguel, Pepito & Txalcala Team
# OBJETIVO: Automatización de auditoría de red aplicando diseño defensivo
# ===========================================================================

# --- 1. Configuraciones Globales generales: modos de escucha y características de control visual
set -e # Abortar el script inmediatamente si algún comando interno falla
stty -echoctl # Ocultar visualmente carácteres de control como ^C en la pantalla
read -r ip_usuario

# --- 2. Definición de variables/constantes globales (Centralización de datos)
LOG_FILE="auditoria_sistema.log"
VERSION="1.0.0"

# --- 3. Definición de Funciones Modulares.
# Función de Ayuda e interfaz de Usuario.
mostrar_ayuda() {
    echo "======================================================="
    echo "SISTEMA DE AUDITORÍA AUTOMATIZADA - VERSIÓN $VERSION"
    echo "======================================================="
    echo "Uso: ./proyecto_final.sh [OPCIONES]"
    echo "Opciones:"
    echo "   -h, --help      Muestra este menú de ayuda estructurado."
    echo "   -i, --ip [IP]   Específica la dirección IP para validar y auditar."
    exit 0
}

# Función de Limpieza y Restauración del entorno
limpiar_entorno() {
    echo -e "\n [CLEANUP] Restaurando propiedades de la terminal..."
    stty echoctl # Devolver la terminal del usuario a su estado normal
}

trap limpiar_entorno EXIT # Interceptar cualquier salida para limpiar el sistema y de manera controlada

# Función de Registro de Logs Estructurados
registrar_log() {
    local nivel="$1"
    local mensaje="$2"
    printf "[%s] [%s] %s\n" "$(date '+%Y-%m-%d %H:%M:%S')" "$nivel" "$mensaje" >> "$LOG_FILE"
}

# Función de Validación Defensiva de Entrada
validar_ip() {
    local ip_evaluar="$1"
    # Definimos una Expresión Regular robusta para evitar Command Injection
    if [[ "$ip_evaluar" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        registrar_log "INFO" "Validación exitosa para la dirección IP: $ip_evaluar"
        echo "✔ IP válida."
        return 0
    else
        registrar_log "ERROR" "Intento de acceso o formato inválido: '$ip_evaluar'"
        echo "❌ Error: Dirección IP con formato inválido o malicioso." >&2
        return 1
    fi
}

# --- 4. Lógica Principal (Main Body)

# Interceptar si el argumento inicial es vacío o si el usuario solicita ayuda
if [[ -z "$1" || "$1" == "-h" || "$1" == "--help" ]]; then
    mostrar_ayuda
fi

# Procesamiento de banderas utilizando condicionales
if [[ "$1" == "-i" || "$1" == "--ip" ]]; then
    # Validamos que el usuario realmente haya provisto el segundo argumento
    if [[ -z "$2" ]]; then
        echo "❌ Error: Falta especificar la dirección IP después de la bandera $1" >&2
        exit 1
    fi

    # Invocar la validación pasando el parámetro correctamente
    validar_ip "$2"
else 
    echo "❌ Error: Opción desconocida '$1'. Usa --help para ver las opciones." >&2
    exit 1
fi