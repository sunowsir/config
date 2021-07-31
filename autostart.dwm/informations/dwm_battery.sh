#!/bin/bash

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity 2> /dev/null)
    STATUS=$(cat /sys/class/power_supply/BAT0/status 2> /dev/null)
    
    local logo="BAT"
    if [[ "$IDENTIFIER" = "unicode" ]] ; then

        logo="ﮣ"
        if [[ "$STATUS" = "Discharging" ]]; then

            [[ ${CHARGE} -gt 0 ]] && [[ ${CHARGE} -le 10 ]] &&
                logo="";
            [[ ${CHARGE} -gt 10 ]] && [[ ${CHARGE} -le 40 ]] &&
                logo="";
            [[ ${CHARGE} -gt 40 ]] && [[ ${CHARGE} -le 60 ]] &&
                logo="";
            [[ ${CHARGE} -gt 60 ]] && [[ ${CHARGE} -le 95 ]] &&
                logo=""; 
            [[ ${CHARGE} -gt 95 ]] &&
                logo=""

        fi
    fi

    echo -en "${logo} ${CHARGE:?}%"
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
