#!/bin/sh


# for file in /home/xollad/Videos/courses/high_performance_computing/*
# do
#   # ffmpeg -i $file -filter_complex "[0:v]setpts=0.57*PTS[v];[0:a]atempo=1.75[a]" -map "[v]" -map "[a]" x$file
#   echo $file
# done

for file_name in *.mp4; do ffmpeg -i $file_name -filter_complex "[0:v]setpts=0.57*PTS[v];[0:a]atempo=1.75[a]" -map "[v]" -map "[a]" x$file_name; done
