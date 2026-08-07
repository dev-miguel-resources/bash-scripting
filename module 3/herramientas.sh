# Nota: Estos archivos no llevan set -e ni ejecución directa. Esto caracteriza una librería.
# Su único propósito es almacenar funciones lógicas listas para ser exportadas y reutilizadas.

obtener_fecha_formato() {
    date +"%Y-%m-%d %H:%M:%S"
}

convertir_mayusculas() {
    local texto="$1"
    echo "${texto^^}"
}