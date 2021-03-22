#!/bin/bash
#
#	* File     : main_engine.sh
#	* Author   : sunowsir
#	* Mail     : sunowsir@163.com
#	* Github   : github.com/sunowsir
#	* Creation : 2021年03月19日 星期五 10时23分34秒

DIR="$(dirname "$(readlink -f "$0")")"
export IDENTIFIER="unicode"

source "${DIR}/core/source.sh"
source "${DIR}/config.sh"

declare -A DWM_CORE_ENGINE_Loop_Task_Pid=()

function DWM_CORE_ENGINE_Init() {
    for i in "${!DWM_INIT_LIST[@]}"; do
        eval "${DWM_INIT_LIST[${i}]}" &
    done
}

function DWM_CORE_ENGINE_loop_eval() {
    while [[ "${DWM_TASK_LIST[${1}]}" = "${2}" ]]; do
        source "${DIR}/config.sh"
        eval "${2}"
    done
}

function DWM_CORE_ENGINE_Loop_Task_Check() {
    local pid="${1}"
    local cmd="${2}"

    if ps -ax | awk '{ print $1 }' | grep -e "^${pid}$" > /dev/null ; then
        return 0
    else 
        unset "${DWM_CORE_ENGINE_Loop_Task_Pid["${cmd}"]}"
    fi
    return 1
}

function DWM_CORE_ENGINE_Loop() {
    while true; do
        source "${DIR}/config.sh"

        for i in "${!DWM_TASK_LIST[@]}"; do
            local cmd="${DWM_TASK_LIST[${i}]}"
 
            if DWM_CORE_ENGINE_Loop_Task_Check "${DWM_CORE_ENGINE_Loop_Task_Pid["${cmd}"]}" "${cmd}" ; then
                continue
            fi

            DWM_CORE_ENGINE_loop_eval "${i}" "${cmd}" &
            DWM_CORE_ENGINE_Loop_Task_Pid["${cmd}"]="${!}"
        done

        sleep 0.5
    done
}


