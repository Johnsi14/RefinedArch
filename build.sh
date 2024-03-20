#!/bin/bash

#Locally signing the Keys if they are not on the keyserver
sudo pacman-key --recv-keys E13A47BF81B58F54 --keyserver hkps://keyserver.ubuntu.com
sudo pacman-key --lsign-key E13A47BF81B58F54

sudo mkarchiso -v -w /tmp/archiso-tmp ~/RefinedArch