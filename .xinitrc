#!/bin/sh
xset +fp ~/.fonts
xset fp rehash
compton -b &
xrdb -merge "$HOME/.Xresources"
checkredshift.sh &
urxvtd -q -f &
mopidy &
launchbar &
wal -i "/home/ben/Pictures/Wallpapers/z1y2zRe.jpg"
xset r rate 400 25
