#!/bin/bash

sudo pacman -Sy
#Locally signing the Keys if they are not on the keyserver
sudo pacman-key --recv-keys 6A678B3B845F22B6CC88D847108D8B736681D3D0 --keyserver hkps://keyserver.ubuntu.com
sudo pacman-key --lsign-key 6A678B3B845F22B6CC88D847108D8B736681D3D0

sudo mkarchiso -v -w /tmp/archiso-tmp ~/RefinedArch