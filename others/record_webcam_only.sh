#!/bin/bash

# This script records video.
# It also names files smartly to prevent overwrites.
notify-send "⏺️  WEBCAM Recording Starts in 3 sec"
sleep 3

# Picks a file name for the output file based on availability:
while [[ -f $HOME/Videos/webcam_recording_$n.avi ]]
do
	n=$((n+1))
done
filename="/home/xollad/Videos/webcam_recording_$n.avi"

 
# open webcam

ffplay -f video4linux2 -i /dev/video0 -video_size 320x240 -fflags nobuffer

# start recording
ffmpeg -f alsa -r 16000 -i hw:0,0 \
    -f video4linux2 -s 1280x960 -i /dev/video0 \
    -r 30 -f avi -vcodec mpeg4 -vtag xvid \
    -acodec libmp3lame -ab 196k $filename &

