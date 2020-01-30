#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/scripts/info.sh"

battery="$($CURRENT_DIR/scripts/battery.sh)"
#battery="#[fg=colour196, bg=colour240, bold]|    $($CURRENT_DIR/scripts/battery.sh)   "
branch="$($CURRENT_DIR/scripts/branch.sh)"

battery_interpolation="\${battery}"
branch_interpolation="\${branch}"

do_interpolation() {
	local output="$1"
	local output="${output/$battery_interpolation/$battery}"
	local output="${output/$branch_interpolation/$branch}"
	echo "$output"
}

update_tmux_uptime() {
	local option="$1"
	local option_value="$(get_tmux_option "$option")"
	local new_option_value="$(do_interpolation "$option_value")"
	set_tmux_option "$option" "$new_option_value"
}

main() {
	update_tmux_uptime "status-right"
}

main
