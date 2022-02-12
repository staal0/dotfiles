#!/bin/bash

# Autostart section
dwm_status.sh &
xbanish &
dunst &
xwallpaper --stretch WALLPAPER.PNG &
clipmenud &
numlockx &
qutebrowser &
sleep 5 && alacritty -e fish &
sleep 6 && alacritty -e newsboat &
sleep 7 && signal-desktop &
sleep 5 && alacritty --title "neomutt" -e neomutt &
xrdb $HOME/.Xresources &
polkit-dumb-agent &
setxkbmap -option caps:escape & # Remap Caps Lock to Esc
sleep 5 mw -Y &

exec dwm