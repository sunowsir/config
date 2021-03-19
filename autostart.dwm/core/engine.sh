#!/bin/bash
#
#	* File     : main_engine.sh
#	* Author   : sunowsir
#	* Mail     : sunowsir@163.com
#	* Github   : github.com/sunowsir
#	* Creation : 2021年03月19日 星期五 10时23分34秒

DIR="$(dirname "$(readlink -f "$0")")"
export IDENTIFIER="unicode"

source "${DIR}/config.sh"

function DWM_CORE_ENGINE_Init() {
    for i in "${!DWM_INIT_LIST[@]}"; do
        eval "${DWM_INIT_LIST[${i}]}"
        echo "${DWM_INIT_LIST[${i}]}"
    done
}

function DWM_CORE_ENGINE_Loop_eval() {
    while true; do
        source "${DIR}/config.sh"
        eval "${1}"
        sleep 0.5
    done
}

function DWM_CORE_ENGINE_Loop() {
    for i in "${!DWM_TASK_LIST[@]}"; do
        DWM_CORE_ENGINE_Loop_eval "${DWM_TASK_LIST[${i}]}" &
    done

    wait
}

