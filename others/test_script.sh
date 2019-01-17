echo -e "\n$(tput setaf 7)... ... ............ .............. ...... ... ..."
echo -e "\n$(tput bold)"
secs=$((10))
while [ $secs -gt 0 ]; do
   echo -ne "REBOOTING in $secs\033[0K\r"
   sleep 1
   : $((secs--))
done

echo "... ... ............ .............. ...... ... ..."
echo -e "$(tput sgr0)"

sudo reboot