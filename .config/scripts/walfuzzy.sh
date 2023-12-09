#!/bin/bash
killall waybar;
pkill -f swaybg;
export WPP=$(find ~/Pictures/wallpapers -type f | fzf --preview "swaybg -i {}" --preview-window=up:30%:wrap);
cp $WPP ~/.config/wall.png
# wal -q -c
# wal -q -i ~/.config/wall.png -n && nohup swaybg --image ~/.config/wall.png &> /dev/null &
# wal -q -c 
# wal -q -i ~/.config/wall.png -n
# nohup waybar &> /dev/null &
# pywalfox update

auto_theme() {
  wal -q -c
  wal -q -i ~/.config/wall.png -n && nohup swaybg --image ~/.config/wall.png &> /dev/null &
  wal -q -c 
  wal -q -i ~/.config/wall.png -n
  nohup waybar &> /dev/null &
  pywalfox update
}

manual_theme() {
  cp -f ~/.cache/wal/colors.json /tmp/fzwal-backup.json

  if [ -n "$1" ]; then
      IS_LIGHT=TRUE
      THEME=$(wal --theme |
              sed '1,/Light Themes/d;/Extra/,$d' |
              sed -e '/^\S/d' -e 's/ - //' |
              fzf --preview='wal -qetl --theme {} && wal --preview')
  else
      THEME=$(wal --theme |
              sed '/Light Themes/,$d' |
              sed -e '/^\S/d' -e 's/ - //' |
              fzf --preview='wal -qet --theme {} && wal --preview')
  fi


  if [ -n "$THEME" ]; then
      if [ -n "$IS_LIGHT" ]; then
          wal -ql --theme $THEME
      else
          wal -q --theme $THEME
      fi
  else
      wal -q --theme /tmp/fzwal-backup.json
  fi

  if [ -n "$FZWAL_RESET_CURSOR" ]; then
      for TTY in /dev/pts/*; do
          [ -w $TTY ] && /bin/printf "\e]112\a" > $TTY
      done
      exit 0
  fi
}

update_for_manual() {
  nohup swaybg --image ~/.config/wall.png &> /dev/null &
  nohup waybar &> /dev/null &
  pywalfox update
}


echo "1. auto theme"
echo "2. choose theme"

read -p "Enter your choice (1 or 2): " choice

case $choice in
  1)
    auto_theme;
    ;;
  2)
    manual_theme;
    update_for_manual;
    ;;
  *)
    echo "Invalid choice. Please enter 1 or 2."
    ;;
esac
 
