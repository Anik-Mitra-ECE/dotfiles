#!/bin/bash

# shell scipt to prepend i3status with more stuff

LG=$(setxkbmap -query | awk '/layout/{print $2}') 
echo "$LG | $line" || exit 1
