#!/bin/bash 

source ../utils/validaciones.sh
source ./generar.sh
source ./descargar.sh
source ./estado_inicial.sh

mostrar_menu() {

    opcion=$(whiptail --title "Menú" --menu "Elige una opción:" 15 60 4 --nocancel \
        "1" "Descargar Imagenes" \
        "2" "Generar Imagenes" \
        "3" "Volver para atrás" \
        "4" "Salir" 3>&1 1>&2 2>&3)

    case $opcion in
        1)
           urlImagenes=$(whiptail --inputbox "Ingresar URL de imágenes:" 10 60 3>&1 1>&2 2>&3)
           urlHash=$(whiptail --inputbox "Ingresar URL de hash:" 10 60 3>&1 1>&2 2>&3)
	   eliminar_archivos_carpeta "./../download/archivos"

	   if descargar_imagenes "$urlImagenes" "$urlHash"; then
    	      eliminar_archivos_carpeta "./../download/imagenes"
    	      descomprimir_archivo
    	      whiptail --title "Descarga y verificación finalizada" --msgbox "Se han descargado y verificado las imágenes." 10 60
	   else
    	      whiptail --title "Descarga y verificación no finalizada" --msgbox "No se pudo completar la descarga y verificación de las imágenes." 10 60
	   fi
	   source menu_seleccion.sh
	   ;;
        2)
            valor=$(whiptail --inputbox "Cantidad de imágenes a generar:" 10 60 3>&1 1>&2 2>&3)
            if is_number $valor; then
                eliminar_archivos_carpeta "./../download/imagenes"
                generar_imagenes $valor
                whiptail --title "Generacion finalizada" --msgbox "Se han generado las imagenes correctamente" 10 60
            else
                whiptail --title "Generacion no finalizada" --msgbox "No se ha podido completar la operacion" 10 60
            fi
            source menu_seleccion.sh
            ;;
        3)
            source menu.sh
            ;;
        4)
           whiptail --title "Gracias por usar el programa" --msgbox "Saliendo ..." 10 60 
           exit
            ;;
    esac
}

# Lógica de la opción X
main() {
    while true; do
        mostrar_menu
    done
}

# Llama a la función que contiene la lógica de la opción X
main
