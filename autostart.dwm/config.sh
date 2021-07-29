#!/bin/bash
#
#	* File     : config.sh
#	* Author   : sunowsir
#	* Mail     : sunowsir@163.com
#	* Github   : github.com/sunowsir
#	* Creation : 2021年03月19日 星期五 10时14分51秒

# Change the array to setting dwm status bar information.
DWMBAR_DATA=(
    "$(dwm_memory)"
    "$(dwm_transmission)"
    "$(dwm_alsa)"
    "$(dwm_battery)"
    "$(dwm_date)"
)

# Change the variable setting to your favorite theme
DWMBAR_THEME="282a36"

# Change the varable setting to your wallpapers path by feh to auto change.
WALLPAPERS_PATH="${HOME}/Pictures/wallpapers/"

# You don’t need to use ‘&’ to make the command run in the background, 
# the engine script will automatically run the script you configured in the background.

# Change the array to set the initialization command.
DWM_INIT_LIST=(
    'picom -o 0.95 -i 0.88 --detect-rounded-corners -f -D 5 -c -b --experimental-backends;'
    'sleep 1 && DWM_DISPLAY_set;'
    'sleep 2 && feh --recursive --randomize --bg-fill "${WALLPAPERS_PATH}";'
    'DWM_SETUP_inverse-scroll;'
    'nm-applet;'
    'blueman-applet;'
    'sleep 2 && fcitx5;'
)

# Change the array to set timing tasks.
DWM_TASK_LIST=(
    'DWMBAR_THEME_Main_Handle "${DWMBAR_THEME}" "${DWMBAR_DATA[@]}" && sleep 2;'
    'feh --recursive --randomize --bg-fill "${WALLPAPERS_PATH}" && sleep 3m;'
    'dwm_battery_warning && sleep 1m;'
)


