#!/bin/bash

#	* File     : dwm-status-refresh.sh
#	* Author   : sunowsir
#	* Mail     : sunowsir@163.com
#	* Github   : github.com/sunowsir
#	* Creation : 2021年03月05日 星期五 12时51分36秒

LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")
DSR_Col=(
    "#000000"
    "#8B8989"
    "#fff929"
    "#c20000"
    "#8A2BE2"
    "#00FA9A"
)

export IDENTIFIER="unicode"

# shellcheck source=dwmbar-functions/dwm_transmission.sh
source "$DIR/dwmbar-functions/dwm_transmission.sh"

# shellcheck source=dwmbar-functions/dwm_battery.sh
source "$DIR/dwmbar-functions/dwm_battery.sh"

# shellcheck source=dwmbar-functions/dwm_alsa.sh
source "$DIR/dwmbar-functions/dwm_alsa.sh"

# shellcheck source=dwmbar-functions/dwm_date.sh
source "$DIR/dwmbar-functions/dwm_date.sh"

# shellcheck source=dwmbar-functions/dwm_memory.sh
source "$DIR/dwmbar-functions/dwm_memory.sh"

function gen_block_str() {
    # 文本颜色：^cRGB颜色值^
    # 背景颜色：^bRGB颜色值^
    echo -ne "^b${1}^^c${2}^${3}"
}

function gen_str() {
    local dwm_status=""
    dwm_status="${dwm_status}$(gen_block_str "${DSR_Col[2]}" "${DSR_Col[1]}" " \ue0b0")"
    dwm_status="${dwm_status}$(gen_block_str "${DSR_Col[2]}" "${DSR_Col[0]}" " $(dwm_memory) ")"
    dwm_status="${dwm_status}$(gen_block_str "${DSR_Col[3]}" "${DSR_Col[2]}" "\ue0b0")"
    dwm_status="${dwm_status}$(gen_block_str "${DSR_Col[3]}" "${DSR_Col[0]}" " $(dwm_transmission) ")"
    dwm_status="${dwm_status}$(gen_block_str "${DSR_Col[4]}" "${DSR_Col[3]}" "\ue0b0")"
    dwm_status="${dwm_status}$(gen_block_str "${DSR_Col[4]}" "${DSR_Col[0]}" " $(dwm_alsa) ")"
    dwm_status="${dwm_status}$(gen_block_str "${DSR_Col[5]}" "${DSR_Col[4]}" "\ue0b0")"
    dwm_status="${dwm_status}$(gen_block_str "${DSR_Col[5]}" "${DSR_Col[0]}" " $(dwm_battery) ")"
    dwm_status="${dwm_status}$(gen_block_str "${DSR_Col[1]}" "${DSR_Col[5]}" "\ue0b0")"
    dwm_status="${dwm_status}$(gen_block_str "${DSR_Col[1]}" "${DSR_Col[0]}" " $(dwm_date) ")"

    echo -ne "${dwm_status}"
}

xsetroot -name "$(gen_str)"

