#!/bin/bash

sudo /usr/sbin/rfkill block all
sudo /usr/sbin/rfkill unblock wifi
eval `cat ~/.fehbg` &
#xset m 5 1 #increase pointer speed
xmodmap -e "pointer = 1 2 3 5 4 7 6" #invert touchpad scrolling directions
xscreensaver &
autocutsel &
eval `gpg-agent --daemon`
setxkbmap -layout us,ru -option terminate:ctrl_alt_bksp,grp:led_caps,grp:caps_toggle,compose:ralt
#trayer --edge top --expand false --height 16 --widthtype request &
/usr/sbin/wpa_gui -t &
/usr/lib/notify-osd/notify-osd &
#xcompmgr -C &
