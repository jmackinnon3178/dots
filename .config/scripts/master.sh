#!/bin/bash

echo "1. change wallpaper"
echo "2. change theme"

read -p "Enter your choice (1 or 2): " choice

case $choice in
  1)
    echo "Running Script 1..."
    ranger ~/Pictures/wallpapers
    ;;
  2)
    echo "Running Script 2..."
    ~/.config/scripts/themeaio.sh
    ;;
  *)
    echo "Invalid choice. Please enter 1 or 2."
    ;;
esac

