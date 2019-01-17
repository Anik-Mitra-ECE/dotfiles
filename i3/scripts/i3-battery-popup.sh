#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/xollad/.config/i3/scripts

# add a cronjob which runs this script every 10 minutes
# crontab -e
# */10 * * * * /usr/bin/sh /home/xollad/.config/i3/scripts/i3-battery-popup.sh

export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pidof i3)/environ | cut -d= -f2-)
BATTINFO=`acpi -b`
if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 5 -d " "` < 00:45:00 ]] ; then
    DISPLAY=:0.0 /usr/bin/notify-send -u critical " low battery" "$BATTINFO"
# elif [[  `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 5 -d " "` < 00:55:00 ]]; then
#     DISPLAY=:0.0 /usr/bin/notify-send -u normal "low battery" "$BATTINFO"
# elif [[  `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 5 -d " "` < 00:45:00 ]]; then
#     DISPLAY=:0.0 /usr/bin/notify-send -u critical "LOW BATTERY" "$BATTINFO"
fi
