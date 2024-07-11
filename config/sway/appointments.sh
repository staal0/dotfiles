#!/bin/bash

if [ $1 ]
then
  notify-send -u normal -t 5000 "$( appointments $1 )"
else
  notify-send -u normal -t 5000 "$( khal list )"
fi
