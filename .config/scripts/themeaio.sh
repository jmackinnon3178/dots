#!/bin/bash
kitty -e ~/.config/scripts/pywalthemechanger.sh 
killall waybar
nohup waybar &> /dev/null &
pywalfox update
#map bw shell wal -i %f -n && cp %f ~/.config/wall.png && nohup swaybg --image %f &> /dev/null &
