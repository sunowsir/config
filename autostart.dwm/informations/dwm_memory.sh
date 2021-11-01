#!/bin/bash
#
#	* File     : dwm-memory.sh
#	* Author   : sunowsir
#	* Mail     : sunowsir@163.com
#	* Github   : github.com/sunowsir
#	* Creation : 2021年03月05日 星期五 13时22分12秒


dwm_memory(){
	local memfree_Mb=$(( $( grep -m1 'MemAvailable:' /proc/meminfo | awk '{print $2}') / 1024 ))

    if [ "$IDENTIFIER" = "unicode" ]; then
	    echo -ne " "
    else 
	    echo -ne "MEM "
    fi
    printf "%.2fGB" "$( echo "scale=2; ${memfree_Mb} / 1024" | bc )"
}
