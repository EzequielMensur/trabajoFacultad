
#!/bin/bash

function redimendionar_imagen(){

     local imagen=$1
     local altura=$2
     local longitud=$3
     local carpeta_destino="../imagenes_procesadas"
     local nombre_imagen=$(basename "$imagen")
     local imagen_transformada="${carpeta_destino}/${nombre_imagen}"

     convert "$imagen" -resize "${altura}x${longitud}" "$imagen_redimensionada"

}


