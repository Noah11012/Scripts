#!/usr/bin/sh

s=$(cat settings | awk -F= '{print $2}' | tr '\n' ' ')
get_terminal() {
    terminal=$(echo "$s" | cut -d ' ' -f 1)
    echo $terminal
}

get_terminal_wd_option() {
    terminal_wd_option=$(echo "$s" | cut -d ' ' -f 2)
    echo $terminal_wd_option
}

get_terminal_e_option() {
    terminal_e_option=$(echo "$s" | cut -d ' ' -f 3)
    echo $terminal_e_option
}

get_editor() {
    editor=$(echo "$s" | cut -d ' ' -f 4)
    echo $editor
}
