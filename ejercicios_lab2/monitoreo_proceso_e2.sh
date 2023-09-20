#!/bin/bash

#Este es el ejercicio 2 herramienta para automatizar el monitoreo de un proceso.

#Codigo para verificar si se estan proporcionando los argumentos necesarios.
if [ $# -ne 2 ]; then
	echo "Uso: $0 <nombre del proceso> <comando para ejecutar>"
	exit 1
fi


process_name=$1
command_to_run=$2


#usando un ciclo while

while true; do
	#para comprobar si hay un proceso em ejecuicon 
	if ! pgrep -x "process_name" > /dev/null; then
		echo "El proceso: '$process_name' no se esta ejecutando. Volviendo a iniciar..."
		eval "$command_to_run" &
	fi
	sleep 5 # Aqui se ajusta el intervalo segun lo que sea necesario 
done 
