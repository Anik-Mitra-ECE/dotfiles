#!/bin/sh
#AccuWeather (r) RSS weather tool for conky
#
#USAGE: weather.sh <locationcode>
#
#(c) Michael Seiler 2007
# search location code in : https://pastebin.com/raw/dbtemx5F
# or ~/dotfiles/i3/sctipts/accuweather_location_code.txt
# run this file inside ~/.conkyrc
# popular codes
# Dhaka:   "ASI|BD|BG002|DHAKA" Country = "Bangladesh"
# Hamburg: "EUR|DE|GM006|HAMBURG" Country = "Germany"
# Jena:    "EUR|DE|GM017|ERFURT" Country = "Germany"
# Dresden: "EUR|DE|GM014|DRESDEN" Country = "Germany"

METRIC=1 #Should be 0 or 1; 0 for F, 1 for C

if [ -z $1 ]; then
    echo
    echo "USAGE: conky_weather.sh <locationcode>"
    echo
    exit 0;
fi

#curl -s http://rss.accuweather.com/rss/liveweather_rss.asp\?metric\=${METRIC}\&locCode\=$1 | perl -ne 'if (/Currently/) {chomp;/\<title\>Currently: (.*)?\<\/title\>/; print "$1"; }'

out=`curl --connect-timeout 30 -s http://rss.accuweather.com/rss/liveweather_rss.asp\?metric\=${METRIC}\&locCode\=$1 | perl -ne 'if (/Currently/) {chomp;/\<title\>Currently: (.*)?\<\/title\>/; print "$1"; }'`

# echo $out
# temp=`echo $out | cut -d':' -f 2`
cond=`echo $out | cut -d':' -f 1`
temp=$(echo $out | tr -dc '0-9')

echo $cond : $temp°C
