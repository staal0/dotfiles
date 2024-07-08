#!/bin/bash
systemctl restart --user dunst.service
notify-send -u low -t 3000 'TEST' 'test';
exit
