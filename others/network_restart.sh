#!/usr/bin/env bash

echo "---netplan---"
    sudo netplan apply

echo "---service and systemctl---"
    sudo  systemctl restart NetworkManager.service
    sudo  service network-manager restart

echo "---DEPRICATED OLD STYLE---"
    sudo /etc/init.d/network-manager restart

echo "---nmclii---"
	sudo nmcli networking off
	sudo nmcli networking on

echo "---System V init---"
	sudo /etc/init.d/networking restart

echo "---ifup/ifdown---"
	sudo ifdown -a
	sudo ifup -a

