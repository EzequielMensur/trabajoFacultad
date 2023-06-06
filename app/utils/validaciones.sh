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

function es_persona() {
  local parametro=$1

  nombre="${parametro%.*}"

  IFS=_ read -r palabra1 palabra2 <<< "$nombre"

  if [[ $palabra1 =~ ^[A-Z][a-z]*$ && $palabra2 =~ ^[A-Z][a-z]*$ ]]; then
    return 0
  else
    return 1 
  fi
}
