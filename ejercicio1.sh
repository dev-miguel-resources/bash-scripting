#!/usr/bin/env bash

echo "--- Sustitución de comandos simples ---"
FECHA=$(date +%Y-%m-%d)
echo "Hoy es: $FECHA"

echo -e "\n--- Novedad de Bash 5.2: Anidación limpia ---"
RESULTADO=$(echo "El usuario actual es: $(whoami)")
echo "$RESULTADO"