#!/bin/bash
cp ./sudoers-aur /etc/sudoers
cp ./hostname /etc/hostname
cp ./hosts /etc/hosts
./aur-basic-packages.sh
./create-user.sh
cp ./sudoers-default /etc/sudoers
