#!/bin/bash
#
#	* File     : dwm_status_update.sh
#	* Author   : sunowsir
#	* Mail     : sunowsir@163.com
#	* Github   : github.com/sunowsir
#	* Creation : 2021年03月25日 星期四 10时02分39秒

source "${DIR}/core/source.sh"
source "${DIR}/config.sh"
source "${DIR}/themes/dwmbar-theme-main.sh"

function DWM_STATUS_UPDATE() {
    DWMBAR_THEME_Main_Handle "${DWMBAR_THEME}" "${DWMBAR_DATA[@]}"
}
