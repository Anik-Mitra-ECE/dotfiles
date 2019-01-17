#!/bin/sh

# Conky script for displaying available updates
# in Debian. This script assumes you are in the
# sudo group and require no password for root
# access. Add something as such to your conkyrc:
# ${color}APT: ${color D7D3C5}${execi 28800 ~/dotfiles/i3/scripts/conky_update_search.sh}

# sudo apt-get -qy update > /dev/null
# NUMOFUPDATES=$(sudo aptitude search "~U" | wc -l)
# echo $NUMOFUPDATES Updates Available
sudo apt update
 /usr/lib/update-notifier/apt-check --human-readable | grep packages
