#!/usr/bin/sh

# Lists files in $PATH plus any custom locations we would like dmenu to look at.
# This script is used to launch applications in either /usr/bin or other locations

PATH=~/Desktop/Documents/4coder:$PATH
result=$(echo $PATH | tr ':' ' ' | xargs ls | sed '/:/ d;/^$/ d' | sort | dmenu)
if [ "$result" = "4ed" ]; then
    # I want 4coder to launch in Projects folder
    cd /home/noah/Desktop/Documents/Projects
fi
output=$($result 2>&1)
exit_code=$?
if [ $exit_code -ne 0 ]; then
    # Only give a notification if the exit code is non zero
    notify-send "$(printf "Command %s exited with a non zero exit code" "$result")" "$output"
fi
