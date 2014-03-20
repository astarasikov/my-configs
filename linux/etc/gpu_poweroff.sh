#!/bin/bash

if [ `uname -r` != '3.14.0-rc7' ];then
	echo bad kernel
	exit 0;
fi

if [ -z `grep -o '/sys/kernel/debug' /proc/mounts` ]; then
	mount -t debugfs none /sys/kernel/debug
fi

if [ -d /sys/kernel/debug/vgaswitcheroo ]; then
	if [ ! -z `grep -o 'IGD:+' /sys/kernel/debug/vgaswitcheroo/switch` ]; then
		case $1 in
			0) echo OFF > /sys/kernel/debug/vgaswitcheroo/switch ;;
			*) echo ON > /sys/kernel/debug/vgaswitcheroo/switch ;;
		esac
	fi
fi

exit 0
