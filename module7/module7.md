Laboratorio 1: La anatomía del modo rastreo (+): debug_demo.sh
Esto te permite mostrar en tiempo real como se van asignando los datos en memoria.

Laboratorio 2: Auditoría de sintaxis segura con bash -n: (error_sintaxis.sh)

Laboratorio 3: Uso de bats para pruebas automatizadas sobre scripts.

Comando de instalación: sudo apt update && sudo apt install -y bats

Vamos a lanzar experimentos de prueba sobre mi archivo pruebas.bats para que evalúe la resistencia de mi 
script de validación de IPs (seguridad1.sh)

Comando: bats pruebas.bats

Laboratorio 4: Buenas prácticas de Mantenibilidad
Contexto: En la industria de TI, se estima que el 80% del tiempo que un administrador de sistemas
se gasta en mantener código antiguo. Aquí podemos seguir ciertas recomendaciones para dichas tareas, esto
está sujeto a 4 pilares:

1. Estructura y Arquitectura de un Script Profesional: Un script mantenible nunca empieza a escribir
comandos sueltos en la primera linea: Este debe seguir el siguiente orden jerárquico estricto:

Linea de cabecera (Shebang): #!/bin/bash fija el intérprete de forma explícita.
Encabezado de metadatos: Comentarios detallados con el nombre del script, autor, fecha, objetivo y dependencias
necesarias.

Directivas globales de seguridad: Configuraciones de Bash como set -e (abortar en caso de fallo) y stty para
el control de la terminal.

Variables globales y constantes: Centralizar rutas, nombre de archivos de logs, Ips deben ser definidas al
inicio del documento en mayúsculas (ej: LOG_FILE="auditoria.log"), facilitando su cambio a futuro sin editar
todo el script.

Funciones modulares: Dividir las tareas complejas en pequeños bloques aislados e independientes con variables
locales (ej: log_mensaje(), limpiar_sistema())

Lógica principal (Main body): El bloque final del archivo que invoca ordenadamente a las funciones anterires
en una secuencia lógica limpia.

2. Uso Estricto del Ámbito Local: Cuando creas variables dentro de una función, por defecto Bash las hace
globales, lo que significa que pueden chocar por accidente con otras variables del script y corromper tus
cálculos.

❌ Práctica no mantenible:
calcular_total() {
    resultado=$((10 + 5)) # Variable global invisible por accidente
}

✔ Práctica mantenible y segura:
calcular_total() {
    local resultado=$((10 + 5)) # Variable global invisible por accidente
}

3. Evitar el uso de Comandos Obsoletos (Legacy Commands)
Para mantener la compatabilidad con servidores modernos basados en la nube y optimizar el rendimiento, se deben
desterrar las sintaxis antiguas de POSIX:

No usar comillas invertidas (`command`) para sustitución de comandos; son difíciles de leer y propensar a errores. Usa $(command) en su lugar.

Uso de sintaxis aritmética $(( )).

No uses corchetes simples [ ] para condicionales o expresiones regulares; Usa corchetes dobles [[ ]] porque
son mucho más robustos y seguros.

Para igualdades de cadenas = . Recomendado hacerlo con ==

4. Auto-documentación Inteligente (Manejo de Ayuda)
Un script maduro debe ser capaz de explicarle al usuario como se usa un programa mediante un flag de ayuda
--help o -h para evitar llamadas erróneas al sistema.