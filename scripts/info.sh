#!/bin/bash

get_tmux_option() {
	local option=$1
	local default_value=$2
	local option_value=$(tmux show-option -gqv "$option")
	if [ -z "$option_value" ]; then
		echo "$default_value"
	else
		echo "$option_value"
	fi
}

set_tmux_option() {
	local option="$1"
	local value="$2"
	tmux set-option -gq "$option" "$value"
}


get_battery() {
	BATTERY=$(cat /sys/class/power_supply/BAT0/capacity)
	STATUS=$(cat /sys/class/power_supply/BAT0/status)

	HEART="♥ "
	NoHEART="♡ "
	#InPOWER=

	if [[ "$STATUS" == *"Charging"* ]];
	then
		ICON="♡ "

	elif [[ "$STATUS" == *"Discharging"* ]];
	then
		ICON="♥ "

	fi

	local string=$ICON" "$BATTERY" %"
	echo "$string"
}

git_branch() {

	if git rev-parse --git-dir > /dev/null; then
		branch=$(git rev-parse --abbrev-ref HEAD)

	else
		branch=""
		exit;
	fi;

	local string=$branch
	echo "$string"
}
