#!/bin/bash

uifont="monospace 17"
bg="#282828"
bg0_h="#1d2021"
bg1="#3c3836"
bg2="#504945"
bg3="#665c54"
fg="#ebdbb2"
red="#cc241d"
blue="#458588"
purple="#b16286"
yellow="#d79921"

choice=$(echo -e "shutdown\nreboot\nlogout" | bemenu -c -W 0.25 -i -l 20 -p "power menu:" -B 1 --fn "$uifont" --tf "$red" --hf "$yellow" --sf "$blue" --scf "$blue" --bdr "$purple")

case "$choice" in
  shutdown) alacritty -e sudo pacman -Syu && shutdown -h now & ;;
  reboot) alacritty -e sudo pacman -Syu && shutdown -r now & ;;
  logout) swaymsg exit & ;;
esac
