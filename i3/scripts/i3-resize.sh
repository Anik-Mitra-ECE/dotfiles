#!/bin/bash
# This script was made by `goferito` on Github.

direction=$1
pts="3"
distanceStr="$pts px or $pts ppt"

[ -z $1 ] && echo "No direction provided" && exit 1

function moveChoice {
  act1=$1 # first action
  dir1=$2 # first direction
  act2=$3 # fallback action
  dir2=$4 # fallback direction
  i3-msg resize $1 $2 $distanceStr | grep '"success":true' || \
    i3-msg resize $3 $4 $distanceStr
}

case $direction in
  up)
    moveChoice grow up shrink down
    ;;
  down)
    moveChoice shrink up grow down
    ;;
  left)
    moveChoice shrink right grow left
    ;;
  right)
    moveChoice grow right shrink left
    ;;
esac
