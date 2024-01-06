#!/bin/bash
# set dark mode (wezterm -> kanagawa-wave, nvim -> kanagawa-wave)
colorscheme=$(gum choose "rose-pine" "carbonfox" "zenbones-dark" "nord" "nordfox" )

# set light mode (wezterm -> kanagawa-lotus, nvim -> kanagawa-lotus)
changecolors() {
    sed -i "s|color_scheme = .*|color_scheme = '$colorscheme'|g" $HOME/.config/wezterm/wezterm.lua
    sed -i "s|colorscheme .*|colorscheme '$colorscheme'|g" $HOME/.config/nvim/init.lua
}

gum confirm "Change theme" && changecolors
