#!/bin/bash
#
#	* File     : config.sh
#	* Author   : sunowsir
#	* Mail     : sunowsir@163.com
#	* Github   : github.com/sunowsir
#	* Creation : 2021年03月19日 星期五 10时14分51秒

DIR="$(dirname "$(readlink -f "$0")")"
export IDENTIFIER="unicode"

source "${DIR}/core/source.sh"

DWMBAR_DATA=(
    "$(dwm_memory)"
    "$(dwm_transmission)"
    "$(dwm_alsa)"
    "$(dwm_battery)"
    "$(dwm_date)"
)

# Change the variable setting to your favorite theme
DWMBAR_THEME="default"

# Change the array to set the initialization command.
DWM_INIT_LIST=(
    'sleep 1; DWM_DISPLAY_get; DWM_DISPLAY_set;'
    'picom -o 0.95 -i 0.88 --detect-rounded-corners --vsync --blur-background-fixed -f -D 5 -c -b --experimental-backends'
    'nm-applet &'
    'sleep 2; fcitx5 &'
)

# Change the array to set timing tasks.
DWM_TASK_LIST=(
    'DWM_DISPLAY_get & DWM_DISPLAY_set & sleep 1'
    'DWMBAR_THEME_Main_Handle "${DWMBAR_THEME}" "${DWMBAR_DATA[@]}"; sleep 1 '
    'feh --recursive --randomize --bg-fill ~/Pictures/wallpapers/ & sleep 3m '
)

