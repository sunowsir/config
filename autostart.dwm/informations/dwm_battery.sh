#!/bin/sh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/ACAD/capacity 2> /dev/null)
    STATUS=$(cat /sys/class/power_supply/ACAD/status 2> /dev/null)

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$STATUS" = "Discharging" ]; then
            printf "🔋" 
        else
            printf "🔌"
        fi
    else
        printf "BAT " 
    fi

    if [ "${CHARGE}" != "" ]; then
        printf " %s%%" "${CHARGE}"
    fi

    printf "%s\n" "$SEP2"
    return ${?}
}

