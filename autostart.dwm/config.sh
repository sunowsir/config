#!/bin/bash
#
#	* File     : config.sh
#	* Author   : sunowsir
#	* Mail     : sunowsir@163.com
#	* Github   : github.com/sunowsir
#	* Creation : 2021年03月19日 星期五 10时14分51秒

echo "--config 1"
# Change the array to setting dwm status bar information.
DWMBAR_DATA=(
    "$(dwm_memory)"
    "$(dwm_transmission)"
    "$(dwm_alsa)"
    "$(dwm_battery)"
    "$(dwm_date)"
)

echo "--config 2"
# Change the variable setting to your favorite theme
DWMBAR_THEME="default"

# You don’t need to use ‘&’ to make the command run in the background, 
# the engine script will automatically run the script you configured in the background.

# Change the array to set the initialization command.
DWM_INIT_LIST=(
    'sleep 1 & DWM_DISPLAY_set;'
    'DWM_SETUP_inverse-scroll;'
    'picom -o 0.95 -i 0.88 --detect-rounded-corners --vsync --blur-background-fixed -f -D 5 -c -b --experimental-backends;'
    'nm-applet;'
    'sleep 2 & fcitx5;'
)

# Change the array to set timing tasks.
DWM_TASK_LIST=(
    'DWMBAR_THEME_Main_Handle "${DWMBAR_THEME}" "${DWMBAR_DATA[@]}" & sleep 1;'
    'feh --recursive --randomize --bg-fill ~/Pictures/wallpapers/ & sleep 3m;'
)

