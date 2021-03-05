#!/bin/bash

# copy from http://github.com/theniceboy/scripts

function get_bytes {
	# Find active network interface
	local interface=$(ip route get 8.8.8.8 2>/dev/null| awk '{print $5}')
	local line=$(grep ${interface} /proc/net/dev | cut -d ':' -f 2 | awk '{print "received_bytes="$1, "transmitted_bytes="$9}')
	eval "${line}"
	now=$(date +%s%N)
}

# Function which calculates the speed using actual and old byte number.
# Speed is shown in KByte per second when greater or equal than 1 KByte per second.
# This function should be called each second.

function get_velocity {
	local value=$1
	local old_value=$2
	now=$3

	local timediff=$(($now - $cache_time))
	velKB=$(echo "1000000000*($value-$old_value)/1024/$timediff" | bc)
	if test "$velKB" -gt 1024
	then
		echo $(echo "scale=2; $velKB/1024" | bc)MB/s
	else
		echo ${velKB}KB/s
	fi
}

function refresh_cache() {
    get_bytes
    cache_received_bytes="${received_bytes}"
    cache_transmitted_bytes="${transmitted_bytes}"
    cache_time="${now}"
}

refresh_cache

dwm_transmission () {
    # Calculates speeds
    local vel_recv="$(get_velocity "$received_bytes" "$cache_received_bytes" "$now")"
    local vel_trans="$(get_velocity "$transmitted_bytes" "$cache_transmitted_bytes" "$now")"

    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "🠋 %s 🠉 %s" "${vel_recv}" "${vel_trans}"
    else
        printf "Dow %s Up %s" "${vel_recv}" "${vel_trans}"
    fi

    refresh_cache
}

dwm_transmission
