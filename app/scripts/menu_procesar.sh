#!/bin/bash
source /app/utils/validaciones.sh
source /app/scripts/procesar.sh
source /app/scripts/comprimir.sh
source /app/scripts/estado_inicial.sh

# Variables globales para ancho y alto
ancho=512
alto=512

mostrar_menu() {
    opcion=$(whiptail --title "Menú" --menu "Elige una opción:" 15 60 4 \
        "1" "Seleccionar dimensiones" \
        "2" "Procesar Imagenes" \
        "3" "Volver para atrás" \
        "4" "Salir" 3>&1 1>&2 2>&3)

    case $opcion in
        1)
            ancho=$(whiptail --inputbox "Ancho (Presiona Enter para usar el valor predeterminado 512):" 8 60 512 --title "Seleccionar dimensiones" --ok-button "Aceptar" --cancel-button "Cancelar" 3>&1 1>&2 2>&3)
            alto=$(whiptail --inputbox "Alto (Presiona Enter para usar el valor predeterminado 512):" 8 60 512 --title "Seleccionar dimensiones" --ok-button "Aceptar" --cancel-button "Cancelar" 3>&1 1>&2 2>&3)

            # Asignar valores predeterminados si el usuario presiona Enter
            if [[ -z "$ancho" ]]; then
                ancho=512
            fi

            if [[ -z "$alto" ]]; then
                alto=512
            fi

            if dimension_permitida $ancho && dimension_permitida $alto ; then
                whiptail --msgbox --title "Valores ingresados" --infobox "El valor ingresado es: $ancho y $alto" 8 60
            else
                whiptail --msgbox --title "Valores no permitidos" --infobox "Valores no permitidos. Deben ser mayores que cero." 8 60
            fi
            source "app/scripts/menu_procesar.sh"
            ;;
        2)
           eliminar_archivos_carpeta "app/imagenes_procesadas/"
           procesar_imagenes

           obtener_nombres_sin_extension "app/imagenes_procesadas/" "edit/"
           comprimir_imagenes "app/imagenes_procesadas/" "edit/"
           whiptail --title "Operacion finalizada" --msgbox "Operacion finalizada con exito" 8 60
           source "app/scripts/menu_procesar.sh"
           ;;
        3)
            source "app/scripts/menu.sh"
            ;;
        *)
            whiptail --title "Salir" --msgbox "Saliendo del programa..." 8 60
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

main
