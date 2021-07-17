#!/bin/bash
# Dependency: dunst libnotify-bin
IMG_PATH=/home/staal/scrot/
EDIT=gimp
VIEW=sxiv
TIME=3000 #Miliseconds notification should remain visible

prog="1.quick_fullscreen
2.delayed_fullscreen
3.section
4.view_fullscreen"

cmd=$(dmenu  -l 20  -nf '#f8f8f2' -nb '#20212b' -sf '#f8f8f2' -sb '#44475a' -p 'Choose Screenshot Type'   <<< "$prog")

cd $IMG_PATH
case ${cmd%% *} in
	1.quick_fullscreen)	scrot -d 1 '%Y-%m-%d-@%H-%M-%S-scrot.png'  && notify-send -u low -t $TIME 'Scrot' 'Fullscreen taken and saved'  ;;
	2.delayed_fullscreen)	scrot -d 4 '%Y-%m-%d-@%H-%M-%S-scrot.png'  && notify-send -u low -t $TIME 'Scrot' 'Fullscreen Screenshot saved'    ;;
	3.section)	scrot -s '%Y-%m-%d-@%H-%M-%S-scrot.png' && notify-send -u low -t $TIME 'Scrot' 'Screenshot of section saved'    ;;
	4.view_fullscreen)	scrot -d 1 '%Y-%m-%d-@%H-%M-%S-scrot.png' -e "$VIEW \$f"  && notify-send -u low -t $TIME 'Scrot' 'Screenshot edited and saved' ;;
  	*)		exec "'${cmd}'"  ;;
esac
