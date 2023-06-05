#!/bin/bash

function is_number() {
    local valor=$1

    if [[ $valor =~ ^[0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}
