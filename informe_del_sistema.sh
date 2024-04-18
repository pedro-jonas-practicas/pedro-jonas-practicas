#!/bin/bash
# comandos que voy a implemenar:
#hostname
#date '+%d/%m/%Y %H:%M:%S'
#df -h | grep ' /$'
#who
#free -m
#ps aux |grep bash
# esta linea imprime tal co

get_hosname(){
    echo "El nombre del host es: $(hostname)"
}

get_date(){
    echo "La fecha y hora actual es: $(date '+%d/%m/%Y %H:%M:%S')"
}

get_root_disk_usage(){
    echo "El uso del disco raiz es: $(df -h | grep ' /$')"
}
get_users(){
    echo "Los usuarios activos son: $(who)"
}

get_memory_usage(){
    free -m | awk 'NR==2{printf "Total: %sMB - Disponible: %sMB\n", $2, $7}'
}

get_processes(){
    process_name=$1
    echo "Processes: $(ps aux |grep $process_name)"
}

# this is my main program
main(){
    #echo "ingresa el nombre del proceso a buscar: "
    #read _process_name
    _process_name=$1
    get_hosname
    get_date
    get_root_disk_usage
    get_memory_usage
    get_processes $_process_name
}

main $1