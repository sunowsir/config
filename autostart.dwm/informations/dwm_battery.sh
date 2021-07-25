#!/bin/bash

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity 2> /dev/null)
    STATUS=$(cat /sys/class/power_supply/BAT0/status 2> /dev/null)
    if [ "${CHARGE}" != "" ]; then
        CHARGE="${CHARGE}%"
    fi

    local info="${SEP1}"
    
    if [[ "$IDENTIFIER" != "unicode" ]]; then
        echo -en "${info}BAT ${CHARGE}"
        return "${?}"
    fi

    local logo="🔌"
    [[ "$STATUS" = "Discharging" ]] && 
        logo="🔋"

    echo -en "${info}${logo} ${CHARGE:?}"
    return "${?}"
}

dwm_battery_warning() {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity 2> /dev/null)
    STATUS=$(cat /sys/class/power_supply/BAT0/status 2> /dev/null)
    
    echo "${CHARGE}"
    if [[ "${STATUS}" = "Discharging" ]] && 
       [[ ${CHARGE} -le 70 ]]; then
        notify-send -u critical -t 10000 "🔌 电量过低"
    fi
    
}

dwm_battery_warning
