#!/bin/bash

export XDG_CONFIG_HOME="$HOME/.config"

sudo pacman -S --noconfirm neovim tmux quickshell hyprpaper hyprpicker

ln -s "./alacritty" "$XDG_CONFIG_HOME/alacritty"
ln -s "./hypr" "$XDG_CONFIG_HOME/hypr"
ln -s "./nvim" "$XDG_CONFIG_HOME/nvim"
ln -s "./tmux" "$XDG_CONFIG_HOME/tmux"
ln -s "./waybar" "$XDG_CONFIG_HOME/waybar"
