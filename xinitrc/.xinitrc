#!/bin/sh
alacritty -e tmux &
skypeforlinux &
spotify &
discord &

blueman-applet &

autorandr -c &
xrdb merge ~/.Xresources &
feh --bg-scale ~/background.png &

sleep 1 &

~/.dotfiles/scripts/bar.sh &
dwm
