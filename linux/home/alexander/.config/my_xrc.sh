#!/bin/bash

#gnome-settings-daemon &
sudo /usr/sbin/rfkill block bluetooth uwb ultrawideband wimax wwan gps fm
sudo /usr/sbin/rfkill unblock wifi
eval `cat ~/.fehbg` &
#xset m 5 1 #increase pointer speed
xmodmap -e "pointer = 1 2 3 5 4 7 6" #invert touchpad scrolling directions
xscreensaver &
autocutsel &
eval `gpg-agent --daemon`
setxkbmap -layout us,ru -option terminate:ctrl_alt_bksp,grp:led_caps,grp:caps_toggle,compose:ralt
/usr/sbin/wpa_gui -t &
/usr/lib/notify-osd/notify-osd &
xcompmgr -C &
blueman-applet &
nm-applet &

TSC_NR="`xinput --list | grep 'MicroTouch USB' | grep -P '(?<=id=)\w+' -o`"
if [ ! -z $TSC_NR ]; then
	xinput --map-to-output $TSC_NR HDMI2
fi
