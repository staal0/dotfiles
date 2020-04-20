#!/bin/bash

# Autostart section
dwm_status.sh &
unclutter &
feh --bg-scale ~/wallpaper.png &
clipmenud &
numlockx &
firefox &
thunderbird &
signal-desktop &
sleep 5 && st &
sleep 5 && st &
xrdb /home/staal/.Xresources &

exec dwm
