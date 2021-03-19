#!/bin/bash

# copy from http://github.com/theniceboy/scripts and changed.

function get_bytes {
	# Find active network interface
	local interface=$(ip route get 8.8.8.8 2>/dev/null| awk '{print $5}')
	local line=$(grep ${interface} /proc/net/dev | cut -d ':' -f 2 | awk '{print "received_bytes="$1, "transmitted_bytes="$9}')
	eval "${line}"
	now=$(date +%s%N)
}

function save_old_date() {
    cache_received_bytes="${received_bytes}"
    cache_transmitted_bytes="${transmitted_bytes}"
    cache_time="${now}"
}

function refresh_cache() {
    get_bytes
    save_old_date
    sleep 0.5
    get_bytes
}

function get_velocity {
	local value=${1}
	local cache_value=$2

	local timediff=$(($now - $cache_time))
    local valuediff=$((${value} - ${cache_value}))
    local velKB=$( echo "1000000000 * ${valuediff} / 1024 / ${timediff}" | bc )

	if test "$velKB" -gt 1024
	then
		echo $(echo "scale=2; $velKB/1024" | bc)MB/s
	else
		echo ${velKB}KB/s
	fi
}

dwm_transmission () {
    refresh_cache

    # Calculates speeds
    local vel_recv="$(get_velocity "$received_bytes" "$cache_received_bytes")"
    local vel_trans="$(get_velocity "$transmitted_bytes" "$cache_transmitted_bytes")"

    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "🠋 %s 🠉 %s" "${vel_recv}" "${vel_trans}"
    else
        printf "Dow %s Up %s" "${vel_recv}" "${vel_trans}"
    fi
}

