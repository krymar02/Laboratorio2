#!bin/bash
#ejercicio 1 de la parte 2 escogi el archivo llamado ejercicios que se encuentra en /home/ejercicios/
#Aqui se puede monitorear el directorio
directory_to_monitor="/home/krymar02/ejercicios_lab2/monitoreo_cambios.sh"

# Archivo de registro de cambios
log_file="/home/krymar02/ejercicios_lab2/monitoreo_cambios.sh"

# Hay que asegurase de que el archivo de registro exista o crearloo si no existe
touch "$log_file"


#Se debe Monitorera el directorio en busca de eventos de creación, modificación y eliminación
inotifywait -m -q -e create,modify,delete --format "%T %e %w%f" "$directory_to_monitor" >> "$log_file"


