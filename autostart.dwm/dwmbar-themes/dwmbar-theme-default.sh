#!/bin/bash
#
#	* File     : dwmbar-theme-default.sh
#	* Author   : sunowsir
#	* Mail     : sunowsir@163.com
#	* Github   : github.com/sunowsir
#	* Creation : 2021年03月17日 星期三 19时12分16秒

function DWMBAR_THEME_Rendering() {
    local block_data="${1}"
    local block_str=""

    block_str="${block_str}^b#8B8989^^c#000000^\ue0b1 "
    block_str="${block_str}^b#8B8989^^c#000000^${block_data} "

    echo "${block_str}"
}
