#!/bin/bash
# Laboratorio 3: Testeando el archivo seguridad1.sh

@test "Validar que seguridad.sh acepte una IP correcta" {
    run bash ./seguridad1.sh <<< "192.168.1.10"
    [ "$status" -eq 0 ]
}

@test "Validar que seguridad1.sh rechace un texto malicioso" {
    run bash ./seguridad1.sh <<< "ataque_hacker; rm -rf"
    [ "$status" -eq 1 ]
}