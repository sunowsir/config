#!/bin/bash

sleep 1.5

while true; do
	/bin/bash ~/.config/autostart.dwm/wp-change.sh

    # 更换壁纸的同时刷新一下状态栏，不然会出现状态栏不透明的情况
	bash .~/.config/autostart.dwm/dwm-status-refresh.sh
	sleep 3m
done
