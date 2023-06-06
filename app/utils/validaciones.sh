#!/bin/bash

function is_number() {
    local valor=$1

    if [[ $valor =~ ^[0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}

function dimension_permitida() {

    local valor=$1

    if (( valor > 0 )); then
        return 0  # Retorno exitoso (valor mayor que cero)
    else
        return 1  # Retorno de error (valor no mayor que cero)
    fi

}
