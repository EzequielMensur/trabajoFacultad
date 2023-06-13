#!/bin/bash

source ../utils/validaciones.sh
source ./generar.sh
source ./descargar.sh

mostrar_menu() {

    opcion=$(whiptail --title "Menú" --menu "Elige una opción:" 15 60 4 --nocancel \
        "1" "Descargar Imagenes" \
        "2" "Generar Imagenes" \
        "3" "Volver para atrás" \
        "4" "Salir" 3>&1 1>&2 2>&3)

    case $opcion in
        1)
            source menu_seleccion.sh
            ;;
        2)
            valor=$(whiptail --inputbox "Cantidad de imágenes a generar:" 10 60 3>&1 1>&2 2>&3)
            if is_number $valor; then
                generar_imagenes $valor
                whiptail --title "Generacion finalizada" --msgbox "Se han generado las imagenes correctamente" 10 60
            else
                whiptail --title "Valor inválido" --msgbox "El valor ingresado no es válido. Por favor, ingresa un número." 10 60
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
