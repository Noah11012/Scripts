#!/usr/bin/sh

# Easy way to start editing my config files quickly

set -eu

# We need 4coder if we select '4coder' in dmenu
PATH=~/Desktop/Documents/4coder:$PATH
configs="Open scripts:4coder:nvim:alacritty:scripts"
result=$(echo $configs | tr ':' '\n' | dmenu)
cd ~/Desktop/Documents/Projects/scripts
source ./get_settings.sh

case $result in
    "Open scripts")
        $(get_terminal) $(get_terminal_wd_option) ~/Desktop/Documents/Projects/scripts
        ;;
    "4coder")
        4ed ~/Desktop/Documents/4coder/config.4coder
        ;;
    "nvim")
        $(get_terminal) $(get_terminal_wd_option) nvim ~/.config/nvim/init.vim
        ;;
    "alacritty")
        $(get_terminal) $(get_terminal_e_option) nvim ~/.config/alacritty/alacritty.yml
        ;;
    "scripts")
        config_file=$(ls ~/Desktop/Documents/Projects/scripts -1 | dmenu)
        $(get_terminal) $(get_terminal_wd_option) ~/Desktop/Documents/Projects/scripts $(get_terminal_e_option) nvim $config_file
        ;;
esac
