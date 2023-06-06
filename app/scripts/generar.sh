#!/bin/bash

source ../utils/validaciones.sh

show_menu() {
    clear
    PS3="Selecciona una opción: "
    options=("Descargar imagenes" "Generar Imagenes" "Volver para atras" "Salir")

    select opt in "${options[@]}"; do
        case $opt in
            "Descargar imagenes")
                read -p "Cantidad de imagenes a generar: " valor
                echo $valor
		if is_number $valor; then
    		    echo "El valor ingresado es válido: $valor"
			
		else
    		    echo "El valor ingresado no es válido. Por favor, ingresa un número."
		fi
                ;;
            "Generar Imagenes")
                echo "Has seleccionado la opción 2. Procesar imágenes"
                # Agrega aquí el código para la opción 2
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

