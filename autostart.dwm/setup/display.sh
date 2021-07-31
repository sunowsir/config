#!/bin/bash

# 筛选xrandr结果，对所有已连接的显示器设置该显示器最高分辨率
# sunowsir@163.com
# GNU GPLv3

function DWM_DISPLAY_get() {
    local awk_reso_flag=1;
    local cmd=""
    
    cmd=$(xrandr | tr -s ' ' | sed 's/^\ //g' | awk -v reso_flag="${awk_reso_flag}" '
    {
        if ($2 != "disconnected") { 
            if ($2 == "connected" && reso_flag == 1) {
                reso_flag = 0;
                device = $1;
            } 

            resolution = $1;

            if ($1 ~ /^[0-9]*x[0-9]*/) {
                if (reso_flag == 0) {
                    reso_flag = 1;
                    printf("DWM_DISPLAY_Device[${#DWM_DISPLAY_Device[*]}]=\"%s\";", device);
                } 
                printf("DWM_DISPLAY_Resolution[\"%s\"]=\"${DWM_DISPLAY_Resolution[\"%s\"]} %s\";", device, device, resolution);
            } 
        } 
    }')
    
    echo "declare -A DWM_DISPLAY_Resolution; ${cmd}"
}

function DWM_DISPLAY_set() {
    eval "$(DWM_DISPLAY_get)"

    local cmd_head="xrandr --output"

    for i in "${!DWM_DISPLAY_Device[@]}"; do
        local cmd="${cmd_head}"
        local device="${DWM_DISPLAY_Device[${i}]}"
        local resolution="0x0"

        for reso in ${DWM_DISPLAY_Resolution["${device}"]}; do
            local f_now="$(echo "${resolution}" | sed 's/x[0-9]*//g')"
            local f_new="$(echo "${reso}" | sed 's/x[0-9]*//g')"
            if [[ ${f_new} -ge ${f_now} ]]; then
                resolution="${reso}"
            fi
        done

        eval "${cmd} ${device} --mode ${resolution} --auto"
    done

    xrandr --output DP1 --right-of eDP1 --auto
}

# xrandr --auto --output DP-2 --same-as eDP-1 --size 1920x1080
# xrandr --auto --output HDMI-1  --right-of DP-2 --size 1920x1080
# xrandr --output eDP-1-1 --mode 2160x1440
# xrandr --output DP-1 --mode 1920x1080

