#!/bin/bash

session=$(tmux ls | grep -v attached | grep -e ranger | tail -n 1 | cut -d ':' -f1);


name=$(tmux ls | grep -e ranger | tail -n 1 | cut -d ':' -f1 | cut -d '-' -f2);
echo "session: $session"
echo "name: $name"
alacritty -e hyprctl dispatch 'hl.dsp.focus({workspace = 4})'
if [ -n "$session" ]; then
    alacritty -e tmux attach -t "$session"
elif [ -n "$name" ]; then
    name="ranger-$((name+1))"
    alacritty -e tmux new-session -s "$name" ranger 

else
    alacritty -e tmux new-session -s "ranger-1" ranger
fi
