#!/bin/bash

function unix_command {
  $@
  if [ $? -ne 0 ]; then
    echo "could not run $@ - abort"
    exit 1
  fi
}

# basic update
sudo apt update --fix-missing
sudo apt install python-dev
sudo apt install libjpeg-dev
sudo apt install libjpeg8-dev
sudo apt install libpng3
sudo apt install libfreetype6-dev

# Minimal installation for a Python ecosystem
# for scientific computing

# Editors
apt_install vim neovim gvim ispell
# ...
python3 -m pip install numpy scipy matplotlib ipython jupyter pandas sympy nose scikit-learn keras theano 
python3 -m pip install opencv-python imutils Pillow pprocess h5py scikit-image matplotlib bokeh seaborn
python3 -m pip install virtualenv six argparse lxml pytz requests mock
# ...
