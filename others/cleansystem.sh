#!/bin/bash

# This script cleans up your ubuntu
# Run the following command in a root shell:
# >./ubuntu_cleaner.sh
#
# Author Zaheen Azad
# 1st version - 27.03.2017
# 2nd version - 01.04.2017
# 3nd version - 05.05.2018
# ---------------------------------------------------------------------


# clean: clean clears out the local repository of retrieved package files. 
# It removes everything but the lock file from /var/cache/apt/archives/ and /var/cache/apt/archives/partial/. 
# When APT is used as a dselect(1) method, clean is run automatically. Those who do not use dselect 
# will likely want to run apt-get clean from time to time to free up disk space.

# autoclean: Like clean, autoclean clears out the local repository of retrieved package files. 
# The difference is that it only removes package files that can no longer be downloaded, 
# and are largely useless. This allows a cache to be maintained over a long period without 
# it growing out of control. The configuration option APT::Clean-Installed will prevent 
# installed packages from being erased if it is set to off.

# autoremove: is used to remove packages that were automatically installed to satisfy 
# dependencies for some package and that are no more needed.

#  

clear
echo -e "$(tput setaf 1)... ... ............ .............. ...... ... ..."
echo -e "\n... $(tput bold)Starting Ubuntu Complete Cleanup! ...\n"
echo "... ... ............ .............. ...... ... ..."

echo -e "$(tput sgr0)"
echo -e "$(tput setaf 7)The amount of cache: "
sudo du -h /var/cache/apt/
sleep 3
echo -e "$(tput sgr0)"
echo -e "$(tput setaf 2)\nRefreshing Swap ...\n"
sudo swapoff -a
sudo swapon -a
sleep 2
echo -e "\n$(tput setaf 1)Clean Apt and Aptitude...\n"
echo -e " $(tput sgr0)"
# remove extra packages from cache
sudo apt clean -y
# remove expired packages
sudo apt autoclean -y
# remove packeges that were used to satisfy dependencies for applications that are no longer needed
sudo apt autoremove -y
sudo apt purge

echo -e " $(tput setaf 6)"
# Doing the same with aptitude
#sudo aptitude clean -y
#sudo aptitude autoclean -y
#sudo aptitude autoremove -y
#sudo aptitude purge ~c

echo -e $magenta"\nCleaning Composer Installer... \n"$white
sudo rm -fv ~/.composer/20*

echo -e $magenta"\nCleaning Gems... \n"$white
sudo gem cleanup

echo -e $magenta"\nCleaning Junk Files... \n"$white
rm -rfv ~/.local/share/recently-used.xbel
rm -rfv ~/.xsession-errors*

echo -e $magenta"\nCleaning Vim... \n"$white
rm -rfv ~/.local/share/nvim/backup/*
rm -rfv ~/.local/share/nvim/swap/*
rm -rfv ~/.local/share/nvim/undo/*
rm -rfv ~/.viminfo


echo -e "$(tput setaf 3)"
echo "cleaning Thrash"

sudo chown -R $USER ~/.local/share/Trash 
rm -rfv ~/.local/share/Trash/* 
sudo rm -rfv ~/.cache/thumbnails/*
sudo rm -rfv ~/.thumbnails/*

echo -e "$(tput sgr0)"
# echo -e "$(tput setaf 2)Remove SSH keys ...\n"
# [ -f /home/ubuntu/.ssh/authorized_keys ] && rm /home/xollad/.ssh/authorized_keys

echo -e "$(tput setaf 3)Cleaning log files ...\n"
# sudo find /var/log -type f | while read f; do echo -ne '' > $f; done
    sudo sh -c "echo > /var/log/dpkg.log"
    sudo sh -c "echo > /var/log/wtmp"
    sudo sh -c "echo > /var/log/lastlog"
    sudo sh -c "echo > /var/log/messages"
    sudo sh -c "echo > /var/log/secure"
    sudo sh -c "echo > /var/log/maillog"
    sudo sh -c "echo > /var/log/xferlog"

    sudo rm -rfv /var/log/apt/*.log
    sudo rm -rfv /var/log/mysql/*.log
    sudo rm -rfv /var/log/mysql/*.gz
    sudo rm -rfv /var/log/nginx/*.log.1
    sudo rm -rfv /var/log/lightdm/*.log
    sudo rm -rfv /var/log/lightdm/*.old
    sudo rm -rfv /var/log/lightdm/*.log.1.gz

    sudo rm -rfv /var/log/*.old &> /dev/null
    sudo rm -rfv /var/log/*.0 &> /dev/null
    sudo rm -rfv /var/log/*.1 &> /dev/null
    sudo rm -rfv /var/log/*.2 &> /dev/null
    sudo rm -rfv /var/log/*.3 &> /dev/null
    sudo rm -rfv /var/log/*.gz &> /dev/null

    sudo rm -rfv /var/log/apt/*.old &> /dev/null
    sudo rm -rfv /var/log/apt/*.0 &> /dev/null
    sudo rm -rfv /var/log/apt/*.1 &> /dev/null
    sudo rm -rfv /var/log/apt/*.2 &> /dev/null
    sudo rm -rfv /var/log/apt/*.3 &> /dev/null
    sudo rm -rfv /var/log/apt/*.gz &> /dev/null


echo -e "$(tput setaf 4)Cleaning bash history ...\n"
unset HISTFILE
[ -f /root/.bash_history ] && rm /root/.bash_history
[ -f /home/ubuntu/.bash_history ] && rm /home/ubuntu/.bash_history


echo -e "$(tput setaf 3)Extra Stuff ...\n"
## Cleaning up old karnels
#dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs apt-get -y purge
sudo gksu update-grub

# Get rid of unnecessary locale data - removing unneeded localizations 
sudo localepurge

#Get rid of "orphaned" packages -  
sudo deborphan | xargs sudo apt-get -y remove --purge



echo -e "$(tput sgr0)"
echo -e "$(tput setaf 2)The amount of cache: "
sudo du -h /var/cache/apt/

echo -e "\n$(tput setaf 7)... ... ............ .............. ...... ... ..."
echo -e "\n$(tput bold)........ Ubuntu cleanup completed! ........\n"
echo "... ... ............ .............. ...... ... ..."
echo -e "$(tput sgr0)"
