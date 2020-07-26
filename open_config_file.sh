#!/usr/bin/sh

# Easy way to start editing my config files quickly

set -eu

# We need 4coder if we select '4coder' in dmenu
PATH=~/Desktop/Documents/4coder:$PATH
configs="Open scripts:4coder:nvim:alacritty:scripts"
result=$(echo $configs | tr ':' '\n' | dmenu)

case $result in
    "Open scripts")
        alacritty --working-directory ~/Desktop/Documents/Projects/scripts
        ;;
    "4coder")
        4ed ~/Desktop/Documents/4coder/config.4coder
        ;;
    "nvim")
        alacritty -e nvim ~/.config/nvim/init.vim
        ;;
    "alacritty")
        alacritty -e nvim ~/.config/alacritty/alacritty.yml
        ;;
    "scripts")
        config_file=$(ls ~/Desktop/Documents/Projects/scripts -1 | dmenu)
        alacritty --working-directory ~/Desktop/Documents/Projects/scripts -e nvim $config_file
        ;;
esac
