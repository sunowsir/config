#!/bin/bash
#
#	* File     : default-theme.sh
#	* Author   : sunowsir
#	* Mail     : sunowsir@163.com
#	* Github   : github.com/sunowsir
#	* Creation : 2021年03月15日 星期一 17时09分28秒


DWMBAR_THEME_Col_C=(
    "#000000"
    "#8B8989"
    "#fff929"
    "#c20000"
    "#8A2BE2"
    "#00FA9A"
)

DWMBAR_THEME_Col_B=(
    "#8B8989"
    "#fff929"
    "#c20000"
    "#8A2BE2"
    "#00FA9A"
)

DWMBAR_THEME_Modchar=(
    "\ue0b0"
)

function dwmbar_theme_block_gen() {
    local col_c_num=${#DWMBAR_THEME_Col_C[@]}
    local col_b_num=${#DWMBAR_THEME_Col_B[@]}
    local modchar_num=${#DWMBAR_THEME_Modchar[@]}
    local block_pos=${1}
    local block_info="${2}"
    local block_str=""

    block_str="^b${DWMBAR_THEME_Col_B[$((${block_pos} % ${col_b_num}))]}^"
    block_str="${block_str}^c${DWMBAR_THEME_Col_C[0]}^${block_info}"

    block_str="${block_str}^b${DWMBAR_THEME_Col_B[echo "($(${block_pos} + 1) / ${col_b_num}" | bc)]}^"
    block_str="${block_str}^c${DWMBAR_THEME_Col_C[0]}^${DWMBAR_THEME_Modchar[$((${block_pos} % ${modchar_num}))]}"

    echo -en "${block_str}"
}

function dwmbar_theme_gen() {
    local dwmbar_info=${1}
    local dwmbar_str=""
    local index=0

    for str in ${dwmbar_info[*]};do
        dwmbar_str="${dwmbar_str}$(dwmbar_theme_block_gen ${index} "${str}")"
        ((index++))
    done

    echo -en "${dwmbar_str}"
}

dwmbar_theme_gen "${@}"
