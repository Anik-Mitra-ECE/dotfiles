#!/usr/bin/env bash

echo "Usage: $0 [lock|logout|suspend|hibernate|reboot|shutdown]"
DISPLAY=:0 /usr/bin/notify-send -u critical "Press s for shutdown"
DISPLAY=:0 /usr/bin/notify-send -u critical "Press r for reboot"
DISPLAY=:0 /usr/bin/notify-send -u critical "Press l for lock"
DISPLAY=:0 /usr/bin/notify-send -u critical "Press e for logout"
DISPLAY=:0 /usr/bin/notify-send -u critical "Press p for suspend"

lock() {
    #  killall compton
    $HOME/.config/i3/scripts/i3_lock.sh
    #  compton -b
}

case "$1" in
    lock)
        lock
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        systemctl suspend
        ;;
    hibernate)
        systemctl hibernate
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        exit 2
esac

exit 0
