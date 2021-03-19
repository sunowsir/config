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
            if ($1 ~ /^[0-9]*x[0-9]*/ && reso_flag == 0) {
                reso_flag = 1;
                resolution = $1;
                printf("DWM_DISPLAY_Device[${#DWM_DISPLAY_Device[*]}]=\"%s\"; DWM_DISPLAY_Resolution[${#DWM_DISPLAY_Resolution[*]}]=\"%s\";", device, resolution);
            } 
        } 
    }')
    
    eval "${cmd}"
}

function DWM_DISPLAY_set() {
    local cmd_head="xrandr --output "

    for i in "${!DWM_DISPLAY_Device[@]}"; do
        local cmd="${cmd_head}"

        cmd="${cmd}${DWM_DISPLAY_Device[${i}]}"
        cmd="${cmd} --mode ${DWM_DISPLAY_Resolution[${i}]}"

        eval "${cmd}"
    done
}

# xrandr --auto --output DP-2 --same-as eDP-1 --size 1920x1080
# xrandr --auto --output HDMI-1  --right-of DP-2 --size 1920x1080
# xrandr --output eDP-1-1 --mode 2160x1440
# xrandr --output DP-1 --mode 1920x1080

sleep 1
DWM_DISPLAY_get
DWM_DISPLAY_set

