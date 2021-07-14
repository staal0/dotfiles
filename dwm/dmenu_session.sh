#!/bin/bash
#
# a simple dmenu session script 
#
###

DMENU='dmenu -l 20 -nf #f8f8f2 -nb #20212b -sf #f8f8f2 -sb #44475a'
choice=$(echo -e "shutdown\nreboot\nlogout" | $DMENU)

case "$choice" in
  shutdown) shutdown -h now & ;;
  reboot) shutdown -r now & ;;
  logout) pkill dwm & ;;
esac
