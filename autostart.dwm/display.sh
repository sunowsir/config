#!/bin/bash

sleep 1

function set_display() {
    cmd_line="$(xrandr | tr -s ' ' | sed 's/^\ //g' | awk '{
        if ($2 != "disconnected") { 
            if ($2 == "connected") {
                printf("Device=%s; Resolution=", $1);
            } 
            if ($1 ~ /^[0-9]*x[0-9]*/) {
                print $0
            } 
        } 
    }' | grep -Eo '^Device=\S*;\ Resolution=\S*[0-9]*x[0-9]*')"

    for value in $(echo "${cmd_line}" | wc -l)
    do
        eval "${cmd_line}"
        echo "${Device} ${Resolution}"
        xrandr --output ${Device} --mode ${Resolution}
    done
}

# xrandr --auto --output DP-2 --same-as eDP-1 --size 1920x1080
# xrandr --auto --output HDMI-1  --right-of DP-2 --size 1920x1080
# xrandr --output eDP-1-1 --mode 2160x1440
# xrandr --output DP-1 --mode 1920x1080

set_display
