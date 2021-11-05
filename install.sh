#!/usr/bin/bash

declare -a arr=(
  "git"
  "gtk"
  "i3"
  "nvim"
  "polybar"
  "starship"
  "tmux"
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
