#!/bin/bash

file=$(realpath "$1")
line="$2"
col="$3"

nvim_server="127.0.0.1:6666"

session_name="godot"

session=$(tmux ls | grep "$session_name")

if [[ -z "$session" ]]; then
    tmux new-session -d -s "$session_name"
    # tmux send-keys -t "$session_name" nvim\ --listen\ $nvim_server\ "+call cursor($line, $col)"\ "$file" C-m 
    printf -v cmd 'nvim --listen %q %q %q' \
    "$nvim_server" \
    "+call cursor($line, $col)" \
    "$file"

    tmux send-keys -t "$session_name" "$cmd" C-m
    alacritty -e tmux attach -t $session_name
# else 
#     foo=
#     tmux send-keys -t "$session_name" nvim\ --listen\ $nvim_server\ $file C-m 
fi

session=$(tmux ls | grep "$session_name" | grep -v attached)

if [[ -n "$session" ]]; then
    alacritty -e tmux attach -t $session_name
fi

nvim --server "$nvim_server" --remote-send "<C-\><C-N>:\$tabnew $file<CR>"
# TODO:check wheather the file is aleady open or not
# buffer=nvim --headless --server "$nvim_server" --remote-expr "listbuf()"
# if [[ "$buffer" == *"$file"* ]]; then
#     nvim --server "$nvim_server" 
# else 
#     nvim --server "$nvim_server" --remote-send "<C-\><C-N>:\$tabnew $file<CR>"
# fi
