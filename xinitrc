#!/bin/bash

# Autostart section
dwm_status.sh &
unclutter &
feh --bg-scale ~/wallpaper.png &
clipmenud &
numlockx &
firefox &
thunderbird &
st &
st & 
signal-desktop &
xrdb /home/staal/.Xresources &

exec dwm
