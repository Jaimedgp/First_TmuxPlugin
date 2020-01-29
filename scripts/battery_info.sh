#!/usr/bin/env bash

get_battery() {
	BATTERY=$(cat /sys/class/power_supply/BAT0/capacity)
	STATUS=$(cat /sys/class/power_supply/BAT0/status)

	HEART="♥"
	NoHEART="♡"
	#InPOWER=

	if [[ "$STATUS" == *"Charging"* ]];
	then
		ICON=♡

	elif [[ "$STATUS" == *"Discharging"* ]];
	then
		ICON=♥

	fi

	battery=$ICON' '"$BATTERY"' %'
	echo "$battery"
}

get_battery
