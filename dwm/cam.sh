#!/bin/bash
if [ $# -gt 0 ]
then
  if [ $1 = 'all' ]
  then
    mpv -monitoraspect 16:9 -fs -title "cam 1" -fps 20 -demuxer lavf "https://URL/zm/cgi-bin/nph-zms?mode=jpeg&monitor=1&scale=100&maxfps=25&buffer=1000&user=USERNAME&pass=PASSWORD" &
    mpv -monitoraspect 16:9 -fs -title "cam 2" -fps 20 -demuxer lavf "https://URL/zm/cgi-bin/nph-zms?mode=jpeg&monitor=2&scale=100&maxfps=25&buffer=1000&user=USERNAME&pass=PASSWORD" &
    mpv -monitoraspect 16:9 -fs -fs -title "cam 3" -fps 20 -demuxer lavf "https://URL/zm/cgi-bin/nph-zms?mode=jpeg&monitor=3&scale=100&maxfps=25&buffer=1000&user=USERNAME&pass=PASSWORD"
    #mpv -vf cropdetect -monitoraspect 16:9 -fs -title "cam 1" rtsp://USERNAME:PASSWORD@URL:7002/live/1 &
    #mpv -vf cropdetect -monitoraspect 16:9 -fs -title "cam 2" rtsp://USERNAME:PASSWORD@URL:7002/live/2 &
    #mpv -vf cropdetect -monitoraspect 16:9 -fs -title "cam 3" rtsp://USERNAME:PASSWORD@URL:7002/live/4
  else
    mpv -monitoraspect 16:9 -fs -title "cam$1" -fps 20 -demuxer lavf "https://URL/zm/cgi-bin/nph-zms?mode=jpeg&monitor=$1&scale=100&maxfps=25&buffer=1000&user=USERNAME&pass=PASSWORD"
    #mpv -vf cropdetect -monitoraspect 16:9 -fs -title "cam$1" rtsp://USERNAME:PASSWORD@URL:7002/live/$1
  fi
else
echo 'choose cam id'
fi
