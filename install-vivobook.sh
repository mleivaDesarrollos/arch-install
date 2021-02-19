#!/bin/bash
./basic-packages.sh
./amd-packages.sh
pacstrap /mnt libinput libinput-gestures xdotool
