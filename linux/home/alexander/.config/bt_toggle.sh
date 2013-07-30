#!/bin/bash

if [ ! -z "`/usr/sbin/rfkill list bluetooth | grep 'Soft blocked\: yes'`" ]; then
	sudo /usr/sbin/rfkill unblock bluetooth
else
	sudo /usr/sbin/rfkill block bluetooth
fi
