#!/bin/bash

show_menu() {
    clear
    PS3="Selecciona una opción: "
    options=("Seleccionar imágenes" "Procesar imágenes" "Salir")

    select opt in "${options[@]}"; do
        case $opt in
            "Seleccionar imágenes")
                source generar.sh 
                ;;
            "Procesar imágenes")
                source procesar.sh
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
 

# Función principal del programa
main() {
    while true; do
        show_menu
    done
}

# Llama a la función principal para iniciar el programa
main
