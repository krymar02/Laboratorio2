#!/bin/bash
#primero se verifica si se proporciona el numero deproceso como argumento
if [ $# -ne 1 ]; then 
	echo "uso: $0 <ID de proceso>"
	exit 1
fi

#En esta parte obtengo informacion del proceso
process_id=$1
process_info=$(ps -p $process_id -o cmd=,pid=,ppid=,user=,%cpu,mem,stat= --no-headers)
executable_path=$(readlink /proc/$process_id/exe)

#codigo para poder extraer y mostrar la informacion 
process_name=$(echo "$process_info" | awk '{print $1}')
parent_process_id=$(echo "$process_info" | awk '{print $3}')
user=$(echo "$process_info" | awk '{print $4}')
cpu_usage=$(echo "$process_info" | awk '{print $5}')
memory_usage=$(echo "$process_info" | awk '{print $6}')
status=$(echo "$process_info" |" awk '{print $7}')

#Aqui se pone la salida de datos como lo solicita el ejercicio
echo"Nombre del proceso: $process_name"
echo "ID del proceso: $process_id"
echo "Parent process ID: $parent_process_id"
echo "Usuario propietario: $user"
echo "Porcentaje de uso de CPU al momento de correr el script: $cpu_usage"
echo "Consumo de memoria: $memory_usage"
echo "Estado (status): $status"
echo "Path del ejecutable: $executable_path" 
