#!/bin/bash

sudo ip link set dev wlan0 down
sudo ip link set dev wlan0 address $(echo -n 00:60:2f; dd bs=1 count=3 if=/dev/urandom 2>/dev/null | xxd -p | sed 's/../:&/g')
sudo ip link set dev wlan0 up
