#!/bin/bash

source ../utils/validaciones.sh
source ./procesar.sh

show_menu() {
    clear
    PS3="Selecciona una opción: "
    options=("Seleccionar dimensiones" "Generar Imagenes" "Volver para atras" "Salir")
    parametros=()

    select opt in "${options[@]}"; do
        case $opt in
            "Seleccionar dimensiones")
                read -p "Ancho: " ancho
		read -p "Alto: " alto

                if dimension_permitida $ancho && dimension_permitida $alto ; then
                    echo "El valor ingresado es válido: $ancho y $alto"

                else
                    echo "Valores no permitidos. Deben ser mayores que cero."
                fi
		source menu_procesar.sh
                ;;
            "Generar Imagenes")
                echo "Has seleccionado la opción 2. Procesar imágenes"
                # Agrega aquí el código para la opción 2

		source menu_procesar.sh
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
