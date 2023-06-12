#!/bin/bash

source ../utils/validaciones.sh
source ./procesar.sh
source ./comprimir.sh

# Variables globales para ancho y alto
ancho=512
alto=512

show_menu() {
    clear
    PS3="Selecciona una opción: "
    options=("Seleccionar dimensiones" "Procesar Imagenes" "Volver para atras" "Salir")
    parametros=()

    select opt in "${options[@]}"; do
        case $opt in
            "Seleccionar dimensiones")
		read -p "Ancho (Presiona Enter para usar el valor predeterminado 512): " ancho
    		read -p "Alto (Presiona Enter para usar el valor predeterminado 512): " alto

    		# Asignar valores predeterminados si el usuario presiona Enter
    		if [[ -z "$ancho" ]]; then
   		     ancho=512
    		fi

    		if [[ -z "$alto" ]]; then
        	     alto=512
    		fi

                if dimension_permitida $ancho && dimension_permitida $alto ; then
                    echo "El valor ingresado es: $ancho y $alto"

                else
                    echo "Valores no permitidos. Deben ser mayores que cero."
                fi
		source menu_procesar.sh
                ;;
            "Procesar Imagenes")
                echo "Inicio del procesamiento de las imagenes ..."
                procesar_imagenes
		echo "Inicio de generacion de lista.."
                obtener_nombres_sin_extension "./../imagenes_procesadas/" "./../../edit"
		echo "Inicio de generacion de compresion de imagenes"
		comprimir_imagenes "./../imagenes_procesadas/" "./../../edit"

		#source menu_procesar.sh
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
        read -p "Preciona enter para continuar ..."
    done
}

main
