#!/bin/bash

#	* File     : dwm-status-refresh.sh
#	* Author   : sunowsir change and create base theniceboy
#	* Mail     : sunowsir@163.com
#	* Github   : github.com/sunowsir
#	* Creation : 2021年03月05日 星期五 12时51分36秒

LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")
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

# shellcheck source=dwmbar-themes/default-theme.sh
source "$DIR/dwmbar-themes/default-theme.sh"

DSR_BLOCK_DATE=(
    "$(dwm_memory)"
    "$(dwm_transmission)"
    "$(dwm_alsa)"
    "$(dwm_battery)"
    "$(dwm_date)"
)

function gen_str() {
    local block_date_num=${#DSR_BLOCK_DATE[@]}
    local dwm_status=""
    
    for index in "${!DSR_BLOCK_DATE[@]}"; do
        if [[ ${index} -lt ${block_date_num} ]]; then
            dwm_status="${dwm_status}^b#8B8989^^c#000000^ \ue0b1 "
        fi

        dwm_status="${dwm_status}^b#8B8989^^c#000000^${DSR_BLOCK_DATE[${index}]}"
    done
    dwm_status="${dwm_status} "

    echo -ne "${dwm_status}"
}

xsetroot -name "$(gen_str)"
