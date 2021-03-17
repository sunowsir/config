#!/bin/bash
#
#	* File     : dwmbar-theme-main.sh
#	* Author   : sunowsir
#	* Mail     : sunowsir@163.com
#	* Github   : github.com/sunowsir
#	* Creation : 2021年03月17日 星期三 17时20分22秒


function DWMBAR_THEME_Main_Handle() {
    local LOC=$(readlink -f "$0")
    local DIR=$(dirname "$LOC")
    export IDENTIFIER="unicode"

    local theme_name="${1}"
    local data_list=${2}
    local status_bar_str=""

    source "${DIR}/dwmbar-theme-${theme_name}.sh"

    for ((i = 0; i < ${#data_list[*]}; i++)); do
        status_bar_str="${status_bar_str}$(DWMBAR_THEME_Rendering "${data_list[${i}]}")"
    done

    xsetroot -name "${status_bar_str}"
    return ${?}
}
