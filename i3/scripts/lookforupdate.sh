#!/bin/bash
# Conky script for displaying available updates
# in Debian. This script assumes you are in the
# sudo group and require no password for root
# access. Add something as such to your conkyrc:
#${color}APT: ${color D7D3C5}${execi 28800 ~/dotfiles/i3/scripts/lookforupdate.sh}

sudo apt-get -qy update > /dev/null
NUMOFUPDATES=$(sudo aptitude search "~U" | wc -l)
echo $NUMOFUPDATES Updates Available
