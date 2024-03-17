#!/bin/sh

#RefinedArch 
#https://github.com/Johnsi14/RefinedArch

#Fast Startupscript for hyprland
#Copyed from https://www.reddit.com/r/hyprland/comments/127m3ef/starting_hyprland_directy_from_systemd_a_guide_to/


[ ! -f /run/udev/data/+drm:card0-eDP-1 ] \
 && sudo systemctl restart systemd-udev-trigger -q

sudo systemctl status iwd|grep Active..active \
 || sudo systemctl start iwd &

while [ ! -f /run/udev/data/+drm:card0-eDP-1 ] ; do echo "waiting for drm" && sleep 0.2 ; done

export USER=live
# shellcheck disable=SC2155
[ -z "$USER" ] || export "USER=$( id -n -u )"
# shellcheck disable=SC2155
[ -n "$UID" ] || export "UID=$( id -u )"
[ -z "$TERM" ] && export TERM=linux
[ -z "$LOGNAME" ] && export "LOGNAME=$USER"
[ -z "$HOME" ] && export "HOME=/home/$USER"
[ -z "$LANG" ] && export LANG=C.UTF-8
[ -z "$PATH" ] && export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
[ -z "$XDG_SEAT" ] && export XDG_SEAT=seat0
[ -z "$XDG_SESSION_TYPE" ]  && export XDG_SESSION_TYPE=tty
[ -z "$XDG_SESSION_CLASS" ] && export XDG_SESSION_CLASS=user
[ -z "$XDG_VTNR" ] && export XDG_VTNR=1
[ -z "$XDG_RUNTIME_DIR" ] && export "XDG_RUNTIME_DIR=/run/user/$UID"
[ -z "$DBUS_SESSION_BUS_ADDRESS" ] && export "DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$UID/bus"

export HYPRLAND_LOG_WLR=1
export XCURSOR_SIZE=24

# change the theme here
export XCURSOR_THEME=Bibata-Modern-Classic
export GTK_THEME=Adwaita-amoled-dark-Fix

[ ! -f /run/udev/data/+drm:card0-eDP-1 ] \
 && echo "Hyprland needs drm, bailing out" && exit 0

exec Hyprland > .hyprland.log.txt 2> .hyprland.err.txt