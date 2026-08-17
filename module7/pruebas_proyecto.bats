#!/bin/bash
# Laboratorio 3: Testeando el archivo proyecto_final.sh

@test "Proyecto Final - Validar que la bandera --help funcione correctamente" {
    run ./proyecto_final.sh --help
    [ "$status" -eq 0 ]
    [[ "$output" =~ "SISTEMA DE AUDITORÍA" ]]
}

@test "Proyecto Final - Validar IP Correcta con bandera -i" {
    run ./proyecto_final.sh -i "10.0.0.1"
    [ "$status" -eq 0 ]
    [[ "$output" =~ "✔ IP válida." ]]
}

@test "Proyecto Final - Bloquear Inyección de Comandos" {
    run ./proyecto_final.sh -i "192.168.1.1; rm -rf /"
    [ "$status" -eq 1 ]
    [[ "$output" =~ "❌ Error" ]]
}