#!/bin/sh

cd /tmp
sudo apt update

sudo apt install -y gtkwave
sudo apt install -y git make gnat zlib1g-dev

git clone https://github.com/ghdl/ghdl

cd ghdl
./configure --prefix=/usr/local
make
sudo make install
echo "$0: All done!"

# See the quick start guide to learn basic usage
# https://ghdl.readthedocs.io/en/latest/using/QuickStartGuide.html
# 
# The two main commands are `ghdl -a` (analyse) and `ghdl -r` (run)
# If you copied the full adder example from the quick start guide into
# `full-adder.vhd` and `full-adder_tb.vhd`, you can use ghdl like so:
#
# ghdl -a full-adder.vhd full-adder_tb.vhd
# ghdl -r adder_tb
# > full-adder_tb.vhd:55:16:@8ns:(assertion note): end of test
