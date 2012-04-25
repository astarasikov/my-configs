#!/bin/bash
# TODO: Change above to /bin/sh

BR_FILE=/sys/class/backlight/acpi_video1/brightness
BRIGHTNESS=$(cat $BR_FILE)

if [ "x$1" = "xup" ]; then
	echo $((BRIGHTNESS + 1)) > $BR_FILE
else
	echo $((BRIGHTNESS - 1)) > $BR_FILE
fi
