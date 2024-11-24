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

cd ~/applications
prog="$(ls *.AppImage)"
cmd=$(bemenu -c -W 0.25 -i -l 20 --fn "$uifont" -p 'appimage' -B 1 --tf "$red" --hf "$yellow" --sf "$blue" --scf "$blue" --bdr "$purple" <<< "$prog")

case ${cmd%% *} in
	*)	exec "~/applications/${cmd}"  ;;
esac
