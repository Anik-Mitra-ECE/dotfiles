#!/usr/bin/env bash
DISPLAY=:0 /usr/bin/notify-send -u critical "Press s for shutdown"
DISPLAY=:0 /usr/bin/notify-send -u critical "Press r for reboot  "
DISPLAY=:0 /usr/bin/notify-send -u critical "Press l for lock    "
DISPLAY=:0 /usr/bin/notify-send -u critical "Press e for logout  "
DISPLAY=:0 /usr/bin/notify-send -u critical "Press p for suspend "

paplay ~/dotfiles/i3/scripts/sound2.ogg
