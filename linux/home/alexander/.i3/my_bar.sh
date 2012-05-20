#!/bin/bash

BAT1='/sys/class/power_supply/BAT1'
BAT2='/sys/class/power_supply/BAT2'

battery_status() {
	if [ ! -e "$1" ]; then
		echo "No battery"
	else
		fe="`cat $1/energy_full`"
		ce="`cat $1/energy_now`"
		pwr="`cat $1/power_now`"
		echo "$((pwr / 1000)) mWh ($(((ce * 100)/ fe))%)"
	fi
}

status() {
	echo "`battery_status $BAT1` | `battery_status $BAT2` | `date '+%a %d %b %Y %R'`"
}

while [ "1" ]
do
	status
	sleep 5
done
