#!/bin/bash

cd ~/applications
prog="$(ls *.AppImage)"
#cmd=$(bemenu  -l 20 --nf '#f8f8f2' --nb '#20212b' --sf '#f8f8f2' --sb '#44475a' -p 'Launch AppImage'   <<< "$prog")
uifont="monospace 17"
prompt="#ffffff"
highlight="#3daee9"
cmd=$(bemenu -i -l 20 --fn "$uifont" -p 'Launch AppImage' -B 1 --tf $prompt --hf $highlight --sf $highlight --scf $highlight --bdr $highlight <<< "$prog")

case ${cmd%% *} in
	*)	exec "~/applications/${cmd}"  ;;
esac
