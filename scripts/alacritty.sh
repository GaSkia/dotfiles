#!/bin/bash

sessions=$(tmux ls | grep -v attached | grep -v ranger | tail -n 1 | cut -d ':' -f1);
name=$(tmux ls | grep -v ranger | tail -n 1 | cut -d ':' -f1);
echo "$sessions"
echo "$name"
if [ -n "$sessions" ]; then
    alacritty -e tmux attach -t "$sessions"
elif [ -n "$name" ]; then
    name=$((name+1))
    echo "new shes $name"
    alacritty -e tmux new-session -s "$name"
else
    alacritty -e tmux new-session
fi

