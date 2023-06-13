#!/bin/bash
clear

mostrar_menu() {
    opcion=$(whiptail --nocancel --title "Menú" --menu "Elige una opción:" 15 60 4 \
        "1" "Seleccionar imágenes" \
        "2" "Procesar imágenes" \
        "3" "Salir" 3>&1 1>&2 2>&3)

    case $opcion in
        1)
            source menu_seleccion.sh
            ;;
        2)
            source menu_procesar.sh
            ;;

        *)
            whiptail --title "Salir del programa" --msgbox "Saliendo del programa..." 10 60
            exit 1
            ;;
    esac
}

# Función principal del programa
main() {
    while true; do
        mostrar_menu
    done
}

# Llama a la función principal para iniciar el programa
main
