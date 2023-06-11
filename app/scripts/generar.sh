#!/bin/bash

function generar_imagenes() {
    # Acceder al primer argumento con $1
    local cantidad_imagenes="$1"
    local nombre="$2"
    for ((i=0; i<cantidad_imagenes ; i++))
    do
        url="https://source.unsplash.com/random/900%C3%97700/?person"
        carpeta_destino="../download/imagenes"
        nombre_archivo="$nombre.jpg"
        
        curl -o "$carpeta_destino/$nombre_archivo" "$url"
    done
}

function descargar_nombres() {
    local url="https://raw.githubusercontent.com/fernandezpablo85/name_suggestions/master/assets/dict.csv"
    local archivo_salida="../download/nombre/nombres.txt"
    curl -s "$url" | awk -F ',' '{names = names $1 ","} END {sub(/,$/, "", names); print names}' > "$archivo_salida"
}

function cargar_nombres_memoria() {
    local archivo_entrada="../download/nombre/nombres.txt"
    local nombres_array=()
    
    while IFS= read -r linea; do
        nombres_array+=("$linea")
    done < "$archivo_entrada"

    # Retornar el array de nombres
    echo "${nombres_array[@]}"
}


function generar_nombre_aleatorio() {
    local nombres_array=("$@")
    local cantidad_nombres=${#nombres_array[@]}
    local indice_aleatorio=$((RANDOM % cantidad_nombres))
    local nombre_aleatorio=${nombres_array[$indice_aleatorio]}
    nombre_aleatorio=${nombre_aleatorio//,/_}
    echo "$nombre_aleatorio"
}


#testing

function nombre(){

    nombres=($(cargar_nombres_memoria))
    generar_nombre_aleatorio "${nombres[@]}"

}

