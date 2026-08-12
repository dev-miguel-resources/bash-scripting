Práctica 1: Filtrado de texto con Grep

Comando: grep "^web.*:activo:" servidores.txt

Práctica 2: Modificación de archivos con sed (Editor de flujos (streams))

Comando: sed -i "s/test01:inactivo/test01:activo/" servidores.txt

Práctica 3: Procesamiento con columnas y campos

Servidor: web01 | Usuarios: 150
Servidor: db01  | Usuarios: 450
...

Comando: awk -F: '$5 > 100 { print "Servidor: " $1 " | Usuarios: " $5 }' servidores.txt

Práctica 4: Permite realizar operaciones masivas con find y xargs. Nos permite combinar el buscador
de archivos + el procesador de comandos

Comando: find . -name "*.log" | xargs grep "ERROR"

Comando para no ingresar a sub-carpetas: find . -maxdepth 1 -name "*.log" | xargs grep "ERROR"

Práctica 5: Redirecciones y Pipes.

Comando: grep "Debian" servidores.txt | wc -l > total_debian.txt

Práctica 6: Ordenamiento y limpieza de duplicados (sort y uniq)

Comando: awk -F: '{print $3}' servidores.txt | sort | uniq -c | sort -nr

Práctica 7: Ranking de resultados repetidos (head)

Comando: awk -F: '{print $3}' servidores.txt | sort | uniq -c | sort -nr | head -n 3

Práctica 8: Combina todos los filtros vistos hasta el momento

grep ":activo:" servidores.txt | awk -F: '{print $3}' | sort | uniq -c | sort -nr | head -n 3 > reporte.txt

Práctica 9: El uso avanzado de awk con BEGIN y END

Comando:
awk -F: 'BEGIN { print "--- INICIO REPORTE ---" } { suma += $5 } END { print "Total Usuarios Empresa:",
suma; print "--- FIN ---"}' servidores.txt