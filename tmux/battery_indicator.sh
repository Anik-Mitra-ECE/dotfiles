#!/bin/bash
# show battery info in tmux

HEART='♥ '
current_charge=$(acpi -b | awk -F'[, \t]*' '{print $4}')
echo -n '#[fg=color23]'
echo -n '#[bg=color16]'
echo -n "$HEART"
echo "$current_charge"
