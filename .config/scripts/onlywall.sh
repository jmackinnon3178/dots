#!/bin/bash
killall swaybg
nohup swaybg --image ~/.config/wall.png &> /dev/null &
