#!/bin/bash

# dependencies
sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev 
sudo apt install -y libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev 
sudo apt install -y libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake libgl1-mesa-dev
sudo apt install -y i3lock i3lock-fancy i3status suckless-tools compton rofi help2man dunst xfce4-power-manager rxvt-unicode unclutter
sudo apt install -y arandr    # monitor settings
sudo apt install -y polit     # power management
sudo apt install -y nitrogen  # for random wallpaper
pip install i3ipc

# bluetooth
sudo apt install -y build-essential dkms
cd ~/Downloads
git clone https://github.com/jeremyb31/newbtfix-4.15.git
sudo dkms add ./newbtfix-4.15
sudo dkms install btusb/4.0
#sudo apt purge blueman bluez* bluetooth
#sudo apt install -y blueman bluez:i386 bluetooth bluez* python-bluez 
#sudo apt install -y bluewho indicator-bluetooth libbluetooth-dev libbluetooth3
###############################

sudo /etc/init.d/bluetooth start
sudo service bluetooth start
# sudo apt install -y xbacklight  #-> Does not work on Ubuntu

cd ~/Downloads
git clone https://github.com/haikarainen/light.git
cd light
./autogen.sh
./configure
make
sudo make install

cd ~/Downloads
# clone the repository
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

# compile & install
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install
