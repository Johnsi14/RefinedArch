#!/bin/bash
if [[ ! -e "/etc/pacman.d/RefinedArchDevelopment" ]]; then
    printf "\033[31mRun the Init script first\033[0m"
    exit 1
fi

sudo pacman -Sy

sudo mkarchiso -v -w /tmp/archiso-tmp ~/RefinedArch
