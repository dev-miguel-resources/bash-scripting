#!/usr/bin/env bash

# Control de red de seguridad estricta
set -euo pipefail

echo "--- Comprobando variables vacías (-u) ---"
USUARIO_SISTEMA="Profesor_Bash"

# Error común de tipeo (falta una 'A')
echo "Bienvenido, $USUARIO_SISTEM"


echo "--- Comprobando errores en tuberías (-o pipefail) ---"
# Si está habilitado pipefail si detecta que los valores de opción no existen, genera esa detección y falla
# Si no está habilitado pipefail puede responder con alguno de los valores permitidos aunque uno haya sido definido
comando_falso | wc -l

echo "¡Este mensaje NUNCA debería verse si es el script falló antes!"

