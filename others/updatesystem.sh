#!/usr/bin/env bash

magenta='\e[1;35m'
green='\e[1;32m'
white='\e[0;37m'

clear
echo "-----------------------------"
echo ".........Updating............"
echo "-----------------------------"
sudo apt update

echo "-----------------------------"
echo ".......Upgrading............."
echo "-----------------------------"
sudo apt -y upgrade

echo "-----------------------------"
echo ".......Dist Upgrdaing........."
echo "-----------------------------"
echo ''; echo '';echo '';
echo "─────────────────────────────────────────────────────────────────────────────────────────────────────────────"
sudo apt list --upgradable && sleep 5
echo "─────────────────────────────────────────────────────────────────────────────────────────────────────────────"
sudo apt -y dist-upgrade

echo "-----------------------------"
echo "--------Snap update----------"
echo "-----------------------------"
sudo snap refresh

echo "-----------------------------"
echo "---------VIM update----------"
echo "-----------------------------"
/usr/bin/vim +PlugInstall +PlugUpdate +PlugUpgrade +qa

echo "-----------------------------"
echo "--------nVIM update----------"
echo "-----------------------------"
/usr/bin/nvim +PlugInstall +PlugUpdate +PlugUpgrade +qa

echo "-----------------------------"
echo "------base-16 update---------"
echo "-----------------------------"
cd ~/.config/base16-shell
git pull
./colortest

echo "-----------------------------"
echo "---------fzf update----------"
echo "-----------------------------"
cd ~/.fzf
# git pull

echo "-----------------------------"
echo "----youtube-dl update---------"
echo "-----------------------------"
youtube-dl -U

echo "-----------------------------"
echo "---------npm update----------"
echo "-----------------------------"
sudo npm-check -g
sudo npm-check -gy

echo "-----------------------------"
echo "------flatpack update--------"
echo "-----------------------------"
sudo flatpack update -y -v

echo "-----------------------------"
echo "----font-cache update--------"
echo "-----------------------------"
fc-cache -fv

echo " " && echo " " && echo " "
echo "-----------------------------"
echo "------i3-gaps update---------"
echo "-----------------------------"
echo -e $magenta"\n (PAUSED)Updating & compiling i3-gaps... \n"$white
cd /home/xollad/Downloads/i3-gaps
git pull upstream
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
echo -e $green"\n Previous i3-gaps version: \n"$white
echo "─────────────────────────────────────────────────────────────────────────────────────────────────────────────"
/usr/bin/i3 -v
echo "─────────────────────────────────────────────────────────────────────────────────────────────────────────────"
echo -e $magenta"\n Installing i3-gaps... \n"$white
# sudo make install
echo -e $green"\n Current i3-gaps version: \n"$white
echo "─────────────────────────────────────────────────────────────────────────────────────────────────────────────"
/usr/bin/i3 -v
echo "─────────────────────────────────────────────────────────────────────────────────────────────────────────────"


echo "─────────────────────────────────────────────────────────────────────────────────────────────────────────────"
echo "update anaconda"
# conda update conda -y
# conda update anaconda -y
# conda update --all -y
echo "─────────────────────────────────────────────────────────────────────────────────────────────────────────────"

echo "-----------------------------"
echo "....Cleaning and removing...."
echo "-----------------------------"
sudo chown -R xollad ~/.local/share/Trash && rm -rfv ~/.local/share/Trash/*
sudo rm -rfv ~/.cache/thumbnails/*        # removing thumbnails
sudo apt clean                      # clean out the cache in its entirety
sudo apt autoclean                  # Cleaning up of partial package:
sudo apt  -y autoremove             # removes unused libs and packages and old kernals
