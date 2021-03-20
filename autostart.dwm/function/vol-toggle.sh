#!/bin/bash

function VOL_TOGGLE_get_status() {
    local item="${1}"
    local status=""
    status="$(amixer get "${item}" | tail -n1 | sed -r "s/.*\[(.*)]$/\1/")"
    echo "${status}"
}

function VOL_TOGGLE_HANDLE() {

    case $(VOL_TOGGLE_get_status "Master") in 
        "on")
            /usr/bin/amixer set Master toggle
        ;;
        "off")
            /usr/bin/amixer set Master toggle
            /usr/bin/amixer set Speaker toggle
        ;;
    esac
}
VOL_TOGGLE_HANDLE

