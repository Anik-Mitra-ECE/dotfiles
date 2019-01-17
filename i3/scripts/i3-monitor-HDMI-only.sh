
#!/bin/bash
INTERNAL_OUTPUT="HDMI-1-1"
EXTERNAL_OUTPUT="LVDS-1-1"

# if we don't have a file, start at zero
if [ ! -f "/tmp/monitor_mode2.dat" ] ; then
  monitor_mode="INTERNAL"

# otherwise read the value from the file
else
  monitor_mode=`cat /tmp/monitor_mode2.dat`
fi

if [ $monitor_mode = "INTERNAL" ]; then
        monitor_mode="EXTERNAL"
        xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --auto
else
        monitor_mode="INTERNAL"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto
fi
echo "${monitor_mode}" > /tmp/monitor_mode2.dat
i3-msg restart
