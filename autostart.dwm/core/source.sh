#!/bin/bash
#
#	* File     : source.sh
#	* Author   : sunowsir
#	* Mail     : sunowsir@163.com
#	* Github   : github.com/sunowsir
#	* Creation : 2021年03月19日 星期五 10时24分58秒

DIR="$(dirname "$(readlink -f "$0")")"
export IDENTIFIER="unicode"

shopt -s nullglob
for sfname in "${DIR}/informations/"*.sh; do
    source "${sfname}"
done

for sfname in "${DIR}/setup/"*.sh; do
    source "${sfname}"
done

source "${DIR}/themes/dwmbar-theme-main.sh"

