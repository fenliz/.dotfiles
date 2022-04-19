#!/usr/bin/bash

declare -a arr=(
  "alacritty"
  "autorandr"
  "dwm"
  "git"
  "gtk"
  "nvim"
  "starship"
  "tmux"
  "rofi"
  "xinitrc"
  "Xresources"
  "zsh"
)

echo "Stowing:"

for i in "${arr[@]}"
do
  echo "- $i"
  stow -D "$i"
  stow "$i"
done

echo ""
