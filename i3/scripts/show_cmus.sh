#!/bin/bash

# in conkyrc ->   ${execi 2 /path/to/script}

if [ ! -x /usr/bin/cmus-remote ];
then
echo "cmus is not installed."
exit
fi

ARTIST=$( cmus-remote -Q 2>/dev/null | grep artist | cut -d " " -f 3- )
TITLE=$( cmus-remote -Q 2>/dev/null | grep title | cut -d " " -f 3- )
ALBUM=$( cmus-remote -Q 2>/dev/null | grep album | cut -d " " -f 3- )

# if [ -z "$TITLE" ];
if [ -z "$ALBUM" ];
then
echo "no music playing"
else
echo "⚡now playing : $TITLE"
fi
