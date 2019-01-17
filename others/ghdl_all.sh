#!/bin/sh

# compile all vhdl files and run simulation on gtkwave

a='.vhdl'
b='_tb.vhdl'
tb='_tb'

filename_main="$1"
filename_tb="$1$tb"

ghdl -s $filename_main.vhdl
ghdl -s $filename_tb.vhdl

ghdl -a $filename_main.vhdl
ghdl -a $filename_tb.vhdl

ghdl --elab-run $filename_tb
ghdl -r $filename_tb --vcd=$filename_main.vcd

gtkwave $filename_main.vcd
