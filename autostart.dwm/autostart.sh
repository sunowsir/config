#!/bin/bash

/bin/bash ~/.config/autostart.dwm/display.sh &
/bin/bash ~/.config/autostart.dwm/dwm-status.sh &
/bin/bash ~/.config/autostart.dwm/wp-autochange.sh &

picom -o 0.95 -i 0.88 --detect-rounded-corners --vsync --blur-background-fixed -f -D 5 -c -b --experimental-backends

# picom -o 0.95 -i 0.88 --detect-rounded-corners --vsync --blur-background-fixed -f -D 5 -c -b
## picom -b
# /bin/bash ~/.config/autostart.dwm/tap-to-click.sh &
# /bin/bash ~/.config/autostart.dwm/inverse-scroll.sh &
# /bin/bash ~/.config/autostart.dwm/setxmodmap-colemak.sh &

nm-applet &
blueman-applet &

# xfce4-power-manager &
# xfce4-volumed-pulse &
# /bin/bash ~/.config/autostart.dwm/run-mailsync.sh &

~/.config/autostart.dwm/autostart_wait.sh &
