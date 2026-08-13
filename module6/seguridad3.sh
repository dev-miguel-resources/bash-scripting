#!/bin/bash

# Control de red de seguridad estricta
set -euo pipefail

# Objetivo: Crear un archivo temporal con un nombre único y poderoso en el sistema para evitar ataques
# colisión o lectura por otros usuarios.

# 1. Creación de archivo temporal impredecible
# Llamar a 'mktemp': indicar una plantilla de ruta con una parte dinámica: (XXXXXX).
# El sistema operativo destruirá esas equis en mil. y las reemplazará con 6 carácteres
# alfa-numericos aleatorios y únicos (por ej: '6zpXgM').
# Guardar la ruta dinámica resultante dentro de una variable '$archivo_temporal'.
archivo_temporal=$(mktemp /tmp/mi_reporte.XXXXXX)

# 2. Configuración del trap
trap 'rm -f "$archivo_temporal"' EXIT

# 3. Escritura de datos confiables
echo "Escribiendo datos confidenciales en un archivo seguro..."

# 4. Redirigir un texto simulado de auditoria privada hacia nuestra ruta aleatoria segura.
echo "Datos de auditoria interna" > "$archivo_temporal"

# 5. Vamos a apuntar nuestro archivo temporal y vamos devolver su metadata (contenido).
ls -l "$archivo_temporal"