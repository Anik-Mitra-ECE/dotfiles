#!/bin/bash
# set -e
#
# num=`i3-msg -t get_workspaces | jq 'map(select(.focused == true))[0].num'`
# i3-input -F "rename workspace to \"$num:%s\"" -P 'New name: '
#
# name=`i3-msg -t get_workspaces | jq 'map(select(.focused == true))[0].name'`
# # If empty name was set
# if [[ "$name" =~ ^\"[0-9]+:\"$ ]]
# then
#   # Remove trailing colon and whitespace
#   i3-msg "rename workspace to \"$num\""
# fi

OLD=$(i3-msg -t 'get_workspaces' | sed -e 's/{"num/\n{"num/g' | grep \"focused\":true | sed -e 's/,"/\n/g' | grep name | cut -d\" -f 3)
NEW=$(zenity --text="Enter new name:" --entry --title="Rename workspace $OLD" --entry-text="$OLD")
echo "rename workspace \"$OLD\" to \"$NEW\""
i3-msg "rename workspace \"$OLD\" to \"$NEW\""
