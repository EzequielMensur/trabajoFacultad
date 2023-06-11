#!/bin/bash

function obtener_nombres_sin_extension() {
    local carpeta="$1"
    local carpeta_salida="$2"
    local nombres=()
    local contador_masculino=0
    local contador_femenino=0

    for archivo in "$carpeta"/*; do
        if [[ -f "$archivo" ]]; then
            local nombre=$(basename "$archivo")
            local nombre_sin_extension="${nombre%.*}"
            nombres+=("$nombre_sin_extension")

            if es_mujer "$nombre_sin_extension"; then
                contador_femenino=$((contador_femenino + 1))
            else
                contador_masculino=$((contador_masculino + 1))
            fi
        fi
    done

    echo "Nombres sin extensión: ${nombres[@]}" > "$carpeta_salida/nombres.txt"

    echo "Total de nombres masculinos: $contador_masculino" >> "$carpeta_salida/nombres.txt"
    echo "Total de nombres femeninos: $contador_femenino" >> "$carpeta_salida/nombres.txt"

}

function es_mujer() {
    local nombre="$1"

    local ultimo_caracter=${nombre: -1}
    if [[ $ultimo_caracter =~ [aA] ]]; then
       return 0
    else
       return 1
    fi
}

function comprimir_imagenes() {
    local carpeta="$1"
    local carpeta_salida="$2"

    tar -czvf "$carpeta_salida/imagenes.tar.gz" -C "$carpeta" .
}

# testing
obtener_nombres_sin_extension "./../imagenes_procesadas/" "./../../edit"
comprimir_imagenes "./../imagenes_procesadas/" "./../../edit"
tar -tzvf ./../../edit/imagenes.tar.gz
