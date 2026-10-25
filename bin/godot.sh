#!/bin/bash

file="$1"
line="$2"
col="$3"

nvim_server="127.0.0.1:6666"

session_name="godot"

attached_session=$(tmux ls | grep godot)

if [[ -z "$attached_session" ]]; then
    tmux new-session -d -s "$session_name"
    tmux send-keys -t "$session_name" nvim\ --listen\ $nvim_server\ $file C-m 
    alacritty -e tmux attach -t $session_name
else 
    tmux send-keys -t "$session_name" nvim\ --listen\ $nvim_server\ $file C-m 
fi


nvim --server "$nvim_server" --remote-send "<C-\><C-N>:\$tabnew $file<CR>"
