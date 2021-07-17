#!/bin/bash

# Autostart section
dwm_status.sh &
xbanish &
dunst &
#$HOME/.local/bin/himawaripy &
xwallpaper --stretch WALLPAPER.PNG &
clipmenud &
numlockx &
qutebrowser &
signal-desktop &
alacritty -e paru & 
sleep 5 && alacritty -e newsboat &
sleep 10 && alacritty -e fish &
sleep 5 && alacritty --title "neomutt" -e neomutt &
xrdb $HOME/.Xresources &
setxkbmap -option caps:escape & # Remap Caps Lock to Esc

exec dwm
