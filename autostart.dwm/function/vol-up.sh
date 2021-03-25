#!/bin/bash
DIR="$(dirname "$(readlink -f "$0")")/.."
export IDENTIFIER="unicode"

source "${DIR}/function/dwm_status_update.sh"

/usr/bin/amixer -qM set Master 5%+ umute
#pactl set-sink-volume @DEFAULT_SINK@ +5%

DWM_STATUS_UPDATE
