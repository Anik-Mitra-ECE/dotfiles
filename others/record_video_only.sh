#!/bin/bash

# This script records video.
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
 
### pulse TEST (with audio)
#ffmpeg \
#-f x11grab \
#-s $(xdpyinfo | grep dimensions | awk '{print $2;}') \
#-i :0.0 \
#-f pulse -ac 2 
#-c:v libx264 -qp 0 -r 30 $filename &

### alsa TEST (with audio)
### READ: https://trac.ffmpeg.org/wiki/Capture/ALSA  --> select card
#ffmpeg \
#-f x11grab \
#-s $(xdpyinfo | grep dimensions | awk '{print $2;}') \
#-i :0.0 \
#-f alsa -ac 2 
#-c:v libx264 -qp 0 -r 30 $filename &

### test 3 from --> http://wiki.oz9aec.net/index.php/High_quality_screen_capture_with_Ffmpeg
# ffmpeg -f alsa -i pulse -f x11grab -r 25 -s 1280x720 -i :0.0+0,24 -acodec pcm_s16le 
 #  -vcodec libx264 -vpre lossless_ultrafast -threads 0 $filename &


### Record cord desktop with audio and Webcam
### First use ffplay to display the webcam, then start recording the desktop with the script above.
# ffplay -f video4linux2 -i /dev/video0 -video_size 320x240

# Updating i3blocks recording icon:
# echo ⏺️ > ~/.recordingicon && pkill -RTMIN+9 i3blocks
