#!/bin/bash


function descargar_imagenes(){

    if [ $# -ne 2 ]; then
       echo "Uso: $0 <URL_imagenes> <URL_suma_verificacion>"
       exit 1
    fi

    carpeta_destino="../download/archivos"
    url_imagenes="$1"
    url_suma_verificacion="$2"
    archivo_imagenes="imagenes.zip"

    wget --timeout=5 --tries=1 -O "$carpeta_destino/$archivo_imagenes" "$url_imagenes" || {
        return 1
    }
    
    suma_verificacion_descargada=$(curl --silent "$url_suma_verificacion") || {
        return 1
    }

    suma_verificacion_calculada=$(sha256sum "$carpeta_destino/$archivo_imagenes" | awk '{print $1}')

    if [ "$suma_verificacion_descargada" == "$suma_verificacion_calculada" ]; then
	return 0
    else
	return 1
    fi
}

function descomprimir_archivo() {
    carpeta_destino="../download/imagenes"
    carpeta_origen="../download/archivos"
    archivo_imagenes="imagenes.zip"
    rutaInicial="$carpeta_origen/$archivo_imagenes"
    rutaFinal="../download/imagenes"

    unzip "$rutaInicial" -d "$rutaFinal"

}
                                
