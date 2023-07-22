#!/bin/bash

sudo service apache2 start
archivo_comprimido="imagenes.zip"
destino="/var/www/html/"

if [ -f "$archivo_comprimido" ]; then
    sudo cp "$archivo_comprimido" "$destino"
    echo "Se ha copiado correctamente el archivo"
    hash=$(sha256sum "$archivo_comprimido" | awk '{print $1}')
    echo "El hash del archivo comprimido es: $hash"
    echo "$hash" > "imagenes_hash.txt"
    sudo cp "imagenes_hash.txt" "$destino"
    echo "El archivo con el hash se ha creado en ${destino}hash.txt"
else
    echo "El archivo comprimido no existe."
fi
