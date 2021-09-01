#!/bin/bash
#
#	* File     : dwmbar-theme-main.sh
#	* Author   : sunowsir
#	* Mail     : sunowsir@163.com
#	* Github   : github.com/sunowsir
#	* Creation : 2021年03月17日 星期三 17时20分22秒

function DWMBAR_THEME_Main_Handle() {

    local theme_name="${1}"
    local status_bar_str=""
    
    source "${DIR}/themes/dwmbar-theme-${theme_name}.sh"

    for ((i = 2; i <= ${#}; i++)); do
        status_bar_str="${status_bar_str}$(DWMBAR_THEME_Rendering "${!i}")"
    done

    # xsetroot -name "$(printf ' %.0s\r' {1..1000})${status_bar_str}"
    xsetroot -name "${status_bar_str}"
    return ${?}
}
