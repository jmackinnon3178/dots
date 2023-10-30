#!/bin/bash
#kitty -e ranger ~/Pictures/wallpapers
killall waybar
killall swaybg
wal -q -c
wal -q -i ~/.config/wall.png -n && nohup swaybg --image ~/.config/wall.png &> /dev/null &
wal -q -c 
wal -q -i ~/.config/wall.png -n
nohup waybar &> /dev/null &
pywalfox update
#map bw shell wal -i %f -n && cp %f ~/.config/wall.png && nohup swaybg --image %f &> /dev/null &
