#!/bin/bash
#
#	* File     : autostart.sh
#	* Author   : sunowsir
#	* Mail     : sunowsir@163.com
#	* Github   : github.com/sunowsir
#	* Creation : 2021年03月19日 星期五 10时15分02秒

DIR="$(dirname "$(readlink -f "$0")")"
export IDENTIFIER="unicode"

source "${DIR}/core/engine.sh"

function DWM_AUTOSTART_KILL() {
    for id in  $(pgrep -f "${0//./\\.}" | grep -v $$ | tr -s '\n' ' '); do 
        kill ${id} > /dev/null 2>&1
    done
}

DWM_AUTOSTART_KILL
DWM_CORE_ENGINE_Init
DWM_CORE_ENGINE_Loop
