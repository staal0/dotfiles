#!/bin/bash
killall dunst && dunst &
notify-send -u low -t 3000 'TEST' 'test';
exit
