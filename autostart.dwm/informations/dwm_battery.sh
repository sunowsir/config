#!/bin/bash

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity 2> /dev/null)
    STATUS=$(cat /sys/class/power_supply/BAT0/status 2> /dev/null)

    local declare -a battery_logo;
    battery_logo[0]="";
    battery_logo[1]="";
    battery_logo[2]="";
    battery_logo[3]="";
    battery_logo[4]="";
    battery_logo[5]="";
    battery_logo[6]="";
    battery_logo[7]="";
    battery_logo[8]="";
    battery_logo[9]="";
    battery_logo[10]="";

    battery_logo[11]="";
    
    local logo_idx="BAT"
    if [[ "$IDENTIFIER" = "unicode" ]] ; then
        logo_idx=11
        if [[ "$STATUS" = "Discharging" ]]; then
            logo_idx=$((CHARGE / 10))
        fi
    fi

    printf "%s%3d%%" "${battery_logo[${logo_idx}]}" "${CHARGE:?}"
    return "${?}"
}

dwm_battery_warning() {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity 2> /dev/null)
    STATUS=$(cat /sys/class/power_supply/BAT0/status 2> /dev/null)
    
    [[ "${STATUS}" = "Discharging" ]] && 
        [[ ${CHARGE} -le 10 ]] &&
        notify-send -u critical -t 10000 "ﮣ 电量过低"
    
}
