#!/bin/bash
#!/usr/bin/env bash

# Arguments from Godot (file, line, col)
file="$1"
line="$2"
col="$3"

# Launch alacritty running nvim at the file+position
exec alacritty --hold -e nvim "+call cursor(${line}, ${col})" "$file"

