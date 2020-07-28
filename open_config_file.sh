#!/usr/bin/sh

# Easy way to start editing my config files quickly

set -eu

# We need 4coder if we select '4coder' in dmenu
PATH=~/Desktop/Documents/4coder:$PATH
configs="Open scripts:4coder:nvim:alacritty:scripts"
result=$(echo $configs | tr ':' '\n' | dmenu)
cd ~/Desktop/Documents/Projects/scripts
s=$(cat settings | awk -F= '{print $2}' | tr '\n' ' ')
terminal=$(echo "$s" | cut -d ' ' -f 1)
terminal_wd_option=$(echo "$s" | cut -d ' ' -f 2)
terminal_e_option=$(echo "$s" | cut -d ' ' -f 3)

case $result in
    "Open scripts")
        $terminal $terminal_wd_option ~/Desktop/Documents/Projects/scripts
        ;;
    "4coder")
        4ed ~/Desktop/Documents/4coder/config.4coder
        ;;
    "nvim")
        $terminal $terminal_e_option nvim ~/.config/nvim/init.vim
        ;;
    "alacritty")
        $terminal $terminal_e_option nvim ~/.config/alacritty/alacritty.yml
        ;;
    "scripts")
        config_file=$(ls ~/Desktop/Documents/Projects/scripts -1 | dmenu)
        $terminal $terminal_wd_option ~/Desktop/Documents/Projects/scripts $terminal_e_option nvim $config_file
        ;;
esac
