#!/bin/bash


function descargar_imagenes(){

    archivo_imagenes=$1
    archivo_suma_verificacion=$2
    carpeta_destino="../download/imagenes/"

    echo "Descargando archivo: $archivo_imagenes..."
    wget "$archivo_imagenes" -P "$carpeta_destino"

    suma_verificacion_actual = $(calcular_checksum $)

}

function validad_descarga(){

    if [ $? -ne 0 ]; then
 	echo "Error al descargar el archivo: $archivo_imagenes"
        exit 1
    fi
}

function calcular_checksum(){
    ruta_archivo_imagenes = "$1"

    suma_verificacion_actual=$(md5sum "$ruta_archivo_imagenes" | awk '{print $1}')
    echo "$suma_verificacion_actual"

}

