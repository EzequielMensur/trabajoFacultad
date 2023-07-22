source "app/scripts/generar.sh"

function eliminar_archivos_carpeta() {
    carpeta=$1

    echo "Eliminando archivos en la carpeta: $carpeta"
    rm -f "$carpeta"/*

    echo "Eliminación de archivos completada."
}

function verificar_archivo_nombres() {
    archivo="app/download/nombre/nombres.txt"

    if [[ -f "$archivo" ]]; then
        echo "El archivo de nombres existe"
    else
        descargar_nombres
    fi
}
