#!/bin/bash

#	* File     : dwm-status-refresh.sh
#	* Author   : sunowsir
#	* Mail     : sunowsir@163.com
#	* Github   : github.com/sunowsir
#	* Creation : 2021年03月05日 星期五 12时51分36秒

LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")
export IDENTIFIER="unicode"

source "$DIR/dwmbar-functions/dwm_transmission.sh"
# source "$DIR/dwmbar-functions/dwm_cmus.sh"
# source "$DIR/dwmbar-functions/dwm_resources.sh"
source "$DIR/dwmbar-functions/dwm_battery.sh"
# source "$DIR/dwmbar-functions/dwm_mail.sh"
# source "$DIR/dwmbar-functions/dwm_backlight.sh"
source "$DIR/dwmbar-functions/dwm_alsa.sh"
# source "$DIR/dwmbar-functions/dwm_pulse.sh"
# source "$DIR/dwmbar-functions/dwm_weather.sh"
# source "$DIR/dwmbar-functions/dwm_vpn.sh"
# source "$DIR/dwmbar-functions/dwm_network.sh"
# source "$DIR/dwmbar-functions/dwm_keyboard.sh"
# source "$DIR/dwmbar-functions/dwm_ccurse.sh"
source "$DIR/dwmbar-functions/dwm_date.sh"
source "$DIR/dwmbar-functions/dwm_memory.sh"


# 文本颜色：^cRGB颜色值^
# 背景颜色：^bRGB颜色值^
# xsetroot -name "^b#fff929^^c#000000^$(dwm_memory)^c#fff929^$(echo -e "\ue0b0")   ^b#c20000^^c#000000^$(dwm_network)^c#c20000^$(echo -e "\ue0b0")              "
xsetroot -name " \
^b#fff929^^c#000000^ $(dwm_memory) \
^c#fff929^^b#c20000^$(echo -e "\ue0b0") \
^c#000000^^b#c20000^ $(dwm_transmission) \
^c#c20000^^b#8A2BE2^$(echo -e "\ue0b0") \
^c#000000^^b#8A2BE2^ $(dwm_alsa) \
^c#8A2BE2^^b#00FA9A^$(echo -e "\ue0b0") \
^c#000000^^b#00FA9A^ $(dwm_battery) \
^c#00FA9A^^b#8B8989^$(echo -e "\ue0b0") \
^c#000000^^b#8B8989^ $(dwm_date) \
"

