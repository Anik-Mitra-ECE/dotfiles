#!/usr/bin/env bash

cd ~/Downloads
git clone https://github.com/chronitis/curseradio.git
cd curseradio/
chmod +x setup.py 
pip3 install pyxdg
pip3 install lxml
python3 setup.py build
sudo python3 setup.py install
