#!/bin/bash
#
# /home/user/spotify/spotify.sh > /home/musere/spotify/spotifynowplaying.txt
# /usr/local/bin/spotify current-oneline > /home/user/spotify/spotifynowplaying.txt
#
pid=$(pidof -s spotify)

if [[ ! -z $pid ]]; then
  export $(cat /proc/${pid}/environ | tr '\0' '\n' | grep 'DBUS_SESSION_BUS_ADDRESS=')
  dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:"org.mpris.MediaPlayer2.Player" string:'Metadata' \
    | grep -E -A2 "(xesam:title|xesam:artist)" \
    | grep -E -v "(xesam|array|--|^ +\)$)" \
    | cut -d'"' -f 2 \
    | sed ':a;N;$!ba;s/\n/ - /g'
fi

