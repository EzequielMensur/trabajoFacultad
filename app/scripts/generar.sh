#!/bin/bash

function generar_imagenes() {
    local cantidad_imagenes="$1"
    local nombres=($(cargar_nombres_memoria))
    local carpeta_destino="app/download/imagenes"

    for ((i = 0; i < cantidad_imagenes; i++)); do
        local nombre_imagen=$(generar_nombre_aleatorio "${nombres[@]}")
        local url="https://source.unsplash.com/random/900%C3%97700/?person"
        local nombre_archivo="$nombre_imagen.jpg"
        local ruta_archivo="$carpeta_destino/$nombre_archivo"

        # Verificar si el archivo ya existe
        if [[ -e "$ruta_archivo" ]]; then
            nombre_imagen=$(generar_nombre_aleatorio "${nombres[@]}")
            nombre_archivo="$nombre_imagen.jpg"
            ruta_archivo="$carpeta_destino/$nombre_archivo"
        fi

        curl -o "$ruta_archivo" "$url"
    done
}
function descargar_nombres() {
    local url="https://raw.githubusercontent.com/fernandezpablo85/name_suggestions/master/assets/dict.csv"
    local archivo_salida="app/download/nombre/nombres.txt"
    curl -s "$url" | awk -F ',' '{names = names $1 ","} END {sub(/,$/, "", names); print names}' > "$archivo_salida"
}

function cargar_nombres_memoria() {
    local archivo_entrada="app/download/nombre/nombres.txt"
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
    local nombre_aleatorio

    # Imprimir los nombres en líneas separadas y mezclarlos con shuf
    nombre_aleatorio=$(printf "%s\n" "${nombres_array[@]}" | shuf | head -n 1)
    primer_nombre=$(echo "$nombre_aleatorio" | cut -d "," -f 1)
    segundo_nombre=$(echo "$nombre_aleatorio" | cut -d "," -f 2)

    primer_mayuscula=$(echo "$primer_nombre" | sed 's/\b\(.\)/\u\1/g')
    segundo_mayuscula=$(echo "$segundo_nombre" | sed 's/\b\(.\)/\u\1/g')
    nombre_aleatorio="${primer_mayuscula}_${segundo_mayuscula}"
    echo "$nombre_aleatorio"
}

