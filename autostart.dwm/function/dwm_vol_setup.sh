#!/bin/bash
#
#	* File     : vol-setup.sh
#	* Author   : sunowsir
#	* Mail     : sunowsir@163.com
#	* Github   : github.com/sunowsir
#	* Creation : 2021年03月25日 星期四 16时38分31秒

DIR="$(dirname "$(readlink -f "$0")")/.."
export IDENTIFIER="unicode"

source "${DIR}/function/dwm_status_update.sh"

function VOL_TOGGLE_get_status() {
    local item="${1}"
    local status=""
    status="$(amixer get "${item}" | tail -n1 | sed -r "s/.*\[(.*)]$/\1/")"
    echo "${status}"
}

function VOL_TOGGLE_HANDLE() {
    local op=""
    local status=""
    op="${1}"
    status="$(VOL_TOGGLE_get_status "Master")"

    case "${op}" in 
        "up" | "down")
            if [[ "${status}" = "off" ]]; then
                /usr/bin/amixer set Master toggle > /dev/null 2>&1
                /usr/bin/amixer set Speaker toggle > /dev/null 2>&1
            fi

            case "${op}" in 
                "up")
                    /usr/bin/amixer -qM set Master 5%+ umute > /dev/null 2>&1
                ;;
                "down")
                    /usr/bin/amixer -qM set Master 5%- umute > /dev/null 2>&1
                ;;
            esac
        ;;
        "toggle")
            case "${status}" in 
                "on")
                    /usr/bin/amixer set Master toggle > /dev/null 2>&1
                ;;
                "off")
                    /usr/bin/amixer set Master toggle > /dev/null 2>&1
                    /usr/bin/amixer set Speaker toggle > /dev/null 2>&1
                ;;
            esac
        ;;
    esac

}

VOL_TOGGLE_HANDLE "${@}"
DWM_STATUS_UPDATE
