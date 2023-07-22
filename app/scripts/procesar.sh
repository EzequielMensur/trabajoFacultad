#!/bin/bash
source app/utils/validaciones.sh

#necesita instalar sudo apt-get install html2ps y modificar las politicas de seguridad <policymap>
#  <policy domain="coder" rights="read|write" pattern="PS" />
#</policymap>
 
function redimencionar_imagen(){

     local imagen=$1
     local altura=$2
     local longitud=$3
     local carpeta_destino="app/imagenes_procesadas"
     local nombre_imagen=$(basename "$imagen")
     local imagen_transformada="${carpeta_destino}/${nombre_imagen}"

     if es_persona "$nombre_imagen"; then
	  convert "$imagen" -gravity center -resize ${altura}x${longitud}+0+0 -extent ${altura}x${longitud} "$imagen_transformada"
     fi

}

function procesar_imagenes(){

     carpeta="app/download/imagenes/"

    for archivo in $(find "$carpeta" -type f); do
         redimencionar_imagen $archivo 512 512	
    done
}

#testing
#redimencionar_imagen "./../download/imagenes/Ezequiel_Mensur.jpg" 500 500

