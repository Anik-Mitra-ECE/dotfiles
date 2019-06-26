#!/bin/sh
# I have a cronjob run this every minute to log time spend on the computer in
# `~/.time` for each day. Gives estimate of daily NEEThood.

date=`date '+%d-%m-%y'`
echo $((`cat ~/Dropbox/linux_stuff/laptop_time/log/"$date"`+1)) > ~/Dropbox/linux_stuff/laptop_time/log/"$date"
