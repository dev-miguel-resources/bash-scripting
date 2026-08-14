#!/bin/bash

# Control de red de seguridad estricta
set -euo pipefail

# 1. Solicitar datos al usuario de forma limpia usando printf
printf "Introduce una dirección IP para el análisis: "

# 2. Leer la entrada del usuario
read -r ip_usuario

# 3. Definir un bloque de validación defensiva (Uso de expresiones regulares)
if [[ "$ip_usuario" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    # Condición de formato válido
    # Si la validación pasa la expresión regular, procedemos con un flujo seguro.
    # acceder a íconos: botón windows + .
    # en mac o linux: ctrl + cmd + espacio
    echo "✔ Formato válido. Iniciando escaneo en $ip_usuario"
else 
    # Condición no cúmplida
    echo "❌ Error: La entrada no es una dirección IP válida." >&2
    exit 1
fi

