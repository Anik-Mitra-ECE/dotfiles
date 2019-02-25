#!/bin/sh
# -*- coding: utf-8 -*-
#
# ~/.xinitrc
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# [[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Load .Xdefaults
test -r $HOME/.Xresources && xrdb -merge $HOME/.Xresources
test -r $HOME/.Xdefaults && xrdb -merge $HOME/.Xdefaults


## testing gcalcli
[[ -x /usr/bin/dunst ]] && /usr/bin/dunst -config ~/.dunstrc &

if [ -x /usr/bin/gcalcli ]; then
  while true; do
    /usr/bin/gcalcli remind
    sleep 300
  done &
fi
