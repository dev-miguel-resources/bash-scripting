#!/usr/bin/env bash

# Activar el modo estricto
set -euo pipefail

echo "======================================================"
echo "--- PARTE 1: FORZANDO TIPOS DE DATOS CON 'declare' ---"
echo "======================================================"

# Por defecto bash trata todo como texto
# -i (integer/ entero)
declare -i NUMERO=10
NUMERO=10+5
echo "Resultado matemático nativo (10+5): $NUMERO"

# -r (read only / solo lectura)
declare -r TOKEN="XYZ-123"
echo "Token de seguridad: $TOKEN"

echo "======================================================="
echo "--- PARTE 2: ALCANCE DE VARIABLES (GLOBAL VS LOCAL) ---"
echo "======================================================="

# Variable Global: Declarada fuera de cualquier función.
# Está viva en la memoria durante todo el ciclo de vida del script y accesible desde cualquier lado.
VARIABLE_GLOBAL="[Soy global y todos me ven]"
#VARIABLE_LOCAL="[Soy local y todos me ven]"
#VARIABLE_LOCAL="[Soy local y todos me ven2]"

calcular_alcance() {
    local VARIABLE_LOCAL="[Soy local y solo existo dentro de la función]"
    echo "-> Dentro de la función:"
    echo "   Acceso a global: $VARIABLE_GLOBAL"
    echo "   Acceso a local: $VARIABLE_LOCAL"
}

# Invocamos la función para que se ejecute su código interno
calcular_alcance

echo -e "\n-> Fuera de la función:"
echo "   Acceso a global fuera: $VARIABLE_GLOBAL"
# ERROR INTENCIONAL DE CONTROL
echo "   Acceso a local fuera: $VARIABLE_LOCAL"
