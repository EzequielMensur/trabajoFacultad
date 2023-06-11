#!/bin/bash

source ../utils/validaciones.sh
source ./generar.sh
source ./descargar.sh

show_menu() {

    PS3="Selecciona una opción: "
    options=("Descargar Imagenes" "Generar Imagenes" "Volver para atras" "Salir")

    select opt in "${options[@]}"; do
        case $opt in
            "Generar Imagenes")
                read -p "Cantidad de imagenes a generar: " valor
                echo $valor
		if is_number $valor; then
    		    echo "El valor ingresado es válido: $valor"
	            generar_imagenes $valor
		    
		else
    		    echo "El valor ingresado no es válido. Por favor, ingresa un número."
		fi

		source menu_seleccion.sh
                ;;
            "Descargar Imagenes")
                echo "Has seleccionado la opción 1. Descargar imágenes"

                source menu_seleccion.sh
                ;;
            "Volver para atras")
		source menu.sh
		;;
            "Salir")
                echo "Saliendo del programa..."
                exit
                ;;
            *) 
                echo "Opción inválida. Por favor, selecciona un número del menú."
                ;;
        esac
    done
}

# Lógica de la opción X
main() {
    while true; do
        show_menu
    done
}

# Llama a la función que contiene la lógica de la opción X
main

