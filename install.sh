#!/usr/bin/bash

declare -a arr=(
  "alacritty"
  "autorandr"
  "git"
  "gtk"
  "i3"
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
