#!/bin/bash
# show temperature  info in tmux

TEMP='°C' 
current_charge=$(acpi -t | awk -F'[, \t]*' '{print $4}')
echo -n '#[fg=color70]'
echo -n '#[bg=color52]'
echo -n "$current_charge"
echo "$TEMP"
