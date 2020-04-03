#!/bin/bash

# Autostart section
~/.dwm/dwm_status &
unclutter &
feh --bg-scale ~/wallpaper.png &
clipmenud &
numlockx &
firefox &
st &

exec dwm
