#!/bin/bash
# There are two arguments that can be passed to the script, clear or stats.
#
# $ sudo dnscache stats
# $ sudo dnscache clear

#pass arg
arg=$1

#must be root for systemd-resolve
if [[ $EUID -ne 0 ]]; then
  echo "Sorry, this script must be run as root :(" 1>&2
  exit 1
fi

#clear command
if [[ $arg == 'clear' ]]; then
  systemd-resolve --flush-caches
  echo "DNS cache has been cleared!"
  systemd-resolve --statistics

#stats command
elif [[ $arg == 'stats' ]]; then
  systemd-resolve --statistics

#if no command
else
    echo "Usage: dnscache [clear] or [stats]"
fi
