#!/bin/bash
#
#	* File     : dwm-status-refresh.new.sh
#	* Author   : sunowsir
#	* Mail     : sunowsir@163.com
#	* Github   : github.com/sunowsir
#	* Creation : 2021年03月17日 星期三 17时17分18秒

# Don't change.
LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")
export IDENTIFIER="unicode"


# shellcheck source=dwmbar-themes/dwmbar-theme-main.sh
source "${DIR}/dwmbar-themes/dwmbar-theme-main.sh"

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


# Change the variable setting to your favorite theme
DWMBAR_THEME="default"

# Change the variable setting to the status bar information you need.
DWMBAR_DATA=(
    "$(dwm_memory)"
    "$(dwm_transmission)"
    "$(dwm_alsa)"
    "$(dwm_battery)"
    "$(dwm_date)"
)

DWMBAR_THEME_Main_Handle "${DWMBAR_THEME}" "${DWMBAR_DATA[*]}"









