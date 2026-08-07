#!/usr/bin/env bash

# Control de red de seguridad estricta
set -euo pipefail

# Objetivos: Calcular el espacio en disco de una ruta en nuestra máquina.
calcular_espacio() {
    local ruta_directorio="$1"

    # REGLA GOOGLE: Cuando definas una variable local y ahí le asociaras un valor desde un cálculo
    # mediante comandos, define en la primera linea la variable y en la otra asigna el valor.
    local espacio_total
    # REGLA GOOGLE: Usar siempre $(...) para la inyección de valores para una operación
    # Hacer uso siempre de "" y jamás comillas invertidas (legacy).
    # (du): "Mide el peso de la carpeta donde está guardado este script ahora mismo".
    # s: "Entregame el total considerando subcarpetas o contenido interno para el calculo".
    # h: "Entregame el valor legible de la unidad resultante".
    # falta algo para dejarlo mejor.
    # |: para dar formato a la salida del comando.
    # : imprimir mediante un recorte.
    espacio_total=$(du -sh "$ruta_directorio" | awk '{print $1}' )

    local nombre_carpeta
    # 'pwd': "Danos la ruta absoluta completa, ej: "/home/profesor"
    # 'basename': corta la ruta absoluta y se queda ÚNICAMENTE con la última palabra.
    nombre_carpeta=$(basename "$(pwd)")

    nombre_carpeta_absoluta=$(pwd)

    # Impresión dinámica mediante referencia con "."
    echo "Espacio utilizado por $ruta_directorio: $espacio_total"

    # Impresión estética con el nombre
    echo "Espacio utilizado por [ $nombre_carpeta ]: $espacio_total"

    # Impresión estética con nombre carpeta padre
    echo "Espacio utilizado por [ $nombre_carpeta_absoluta ]: $espacio_total"

}

main() {
    # Referenciar la carpeta actual del usuario mediante el símbolo "."
    # Referenciar la carpeta padre: /home carpeta superior que guarda todos los usuarios
    calcular_espacio "."
}

# Invocar el main
main