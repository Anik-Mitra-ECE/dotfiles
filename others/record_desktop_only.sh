#!/bin/bash

# This script records only desktop without audio
# It also names files smartly to prevent overwrites.
notify-send "⏺️  Recording Starts in 3 sec"
sleep 3

# Picks a file name for the output file based on availability:
while [[ -f $HOME/Videos/recording_$n.mkv ]]
do
	n=$((n+1))
done
filename="/home/xollad/Videos/recording_$n.mkv"

# The actual ffmpeg command:
ffmpeg \
 -f x11grab \
 -s $(xdpyinfo | grep dimensions | awk '{print $2;}') \
 -i :0.0 \
 -c:v libx264 -qp 0 -r 30 $filename &
 

# Updating i3blocks recording icon:
# echo ⏺️ > ~/.recordingicon && pkill -RTMIN+9 i3blocks
