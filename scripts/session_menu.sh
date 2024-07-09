#!/bin/bash

uifont="monospace 17"
prompt="#ffffff"
highlight="#3daee9"
choice=$(echo -e "shutdown\nreboot\nlogout" | bemenu -l 20 -p "Select option:" --fn "$uifont" -B 1 --tf $prompt --hf $highlight --sf $highlight --scf $highlight --bdr $highlight)

case "$choice" in
  shutdown) alacritty -e paru && shutdown -h now & ;;
  reboot) alacritty -e paru && shutdown -r now & ;;
  logout) pkill dwm & ;;
esac
