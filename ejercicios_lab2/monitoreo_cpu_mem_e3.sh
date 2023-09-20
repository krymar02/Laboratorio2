#!bin/bash

#ejercicio nmumero 3
# Herramienta para monitorear el consumo de cpu y memoria de un proceso.

#Primero se debe  veriificar si se proporciona el ejecutable como un argumento
if [ $# -ne ]; then
	echo "Uso: $0 <ejecutable>"
	exit 1 
fi


executable=$1

#Aqui para ejecutar el binario en segundo plano
$executable &
#Aqui se define el nombre del archivo de registro 
log_file="registro_cpu_mem.txt"

#Aqui borra el archivo si ya existe
[ -e "$log_file" ] && rm "$log_file"

echo "Tiempo CPU Memoria" >> "@log_file"

#aqui utilizo un ciclo while 

while true; do
	#se debe obtener  el id del proceso creado anteriormente
	process_id=$(pgrep -o "$(basename "$executable")")
	#se obtiene la info del cpu y mem
	cpu_usage=$(ps -p "$process_id" -o %cpu --no-heaaders)
	memory_usage=$(ps -p "$process_id" -o %mem --no-headers)
	#se obtiene la hora HHMMSS
	timestamp=$(date +"%T")
	#Se registra la informacion en el archivo de registro
	echo "$timestamp $cpu_usage $memory_usage" >> "$log_file"

	#tiempo de espera
	sleep 1
done
