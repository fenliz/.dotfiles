#!/bin/zsh

selected_directory=$(find ~/development ~/ -mindepth 1 -maxdepth 1 -type d | fzf)

if [[ -z $selected_directory ]]; then
	exit 0
fi

selected_session_name=$(basename "$selected_directory" | tr . _)

if test -f "$HOME/.config/zellij/layouts/$selected_session_name.kdl"; then
	zellij --layout $HOME/.config/zellij/layouts/$selected_session_name.kdl a --create $selected_session_name --force-run-commands
else
	zellij a --create $selected_session_name
fi
