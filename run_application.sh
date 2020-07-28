#!/usr/bin/sh

# Lists out commonly used and favorited applications which is specified at ~/Desktop/Documents/Projects/scripts/applications
# File format:
# program-name program-launch-command does-run-in-terminal
# If program-name has any spaces, use double quotes.
# Examples:
#
# "Google Chrome" google-chrome-stable no
# Steam steam no
# Irssi irssi yes
# "File Manager" nemo no

set -eu

# https://stackoverflow.com/questions/29642102/how-to-make-awk-ignore-the-field-delimiter-inside-double-quotes
awk_application() {
    awk -vFPAT='([^ ]+)|("[^"]+")' "$1"
}

# If we select 4coder make sure we are able to launch it by having the binary in our $PATH
PATH=~/Desktop/Documents/4coder:$PATH
cd ~/Desktop/Documents/Projects/scripts
result=$(cat applications | awk_application '{print $1}' | sed 's/\"//g' | dmenu -i -l 10)
if [ -z "$result" ]; then
    exit 1
fi

program_to_run_format=$(printf '/%s/ {print $2}' "$result")
run_in_terminal_format=$(printf '/%s/ {print $3}' "$result")
program_to_run=$(cat applications | awk_application "$program_to_run_format")
run_in_terminal=$(cat applications | awk_application "$run_in_terminal_format")

if [ "$result" = "4coder" ]; then
    cd ~/Desktop/Documents/Projects
fi

if [ "$run_in_terminal" = "yes" ]; then
    alacritty -e $program_to_run
else
    $program_to_run &
fi
