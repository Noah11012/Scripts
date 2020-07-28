#!/usr/bin/sh

cd ~/Desktop/Documents/Projects/scripts
terminal=$(cat settings | awk -F= '{print $2}' | tr '\n' ' ' | cut -d ' ' -f 1)
cd ~/Desktop
$terminal
