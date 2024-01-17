#!/bin/bash
pkill -f swaybg;
export WPP=$(find ~/Pictures/wallpapers -type f | fzf --preview "swaybg -i {}" --preview-window=up:30%:wrap);
cp $WPP ~/.config/wall.png
nohup swaybg -i $WPP &> /dev/null &
