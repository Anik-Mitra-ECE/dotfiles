#!/bin/sh

gnome-terminal -e cmatrix &
sleep 0.2
i3-msg focus right
i3-msg fullscreen
sleep 0.5
# i3lock -n; i3-msg kill
