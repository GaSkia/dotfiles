#!/bin/bash

export XDG_CONFIG_HOME="$HOME/.config"

sudo pacman -S --needed --noconfirm neovim tmux quickshell hyprpaper hyprpicker


rm -rf "$XDG_CONFIG_HOME/alacritty"
rm -rf "$XDG_CONFIG_HOME/hypr"
rm -rf "$XDG_CONFIG_HOME/nvim"
rm -rf "$XDG_CONFIG_HOME/tmux"
rm -rf "$XDG_CONFIG_HOME/waybar"
ln -s "$HOME/dotfiles/alacritty" "$XDG_CONFIG_HOME/alacritty"
ln -s "$HOME/dotfiles/hypr" "$XDG_CONFIG_HOME/hypr"
ln -s "$HOME/dotfiles/nvim" "$XDG_CONFIG_HOME/nvim"
ln -s "$HOME/dotfiles/tmux" "$XDG_CONFIG_HOME/tmux"
ln -s "$HOME/dotfiles/waybar" "$XDG_CONFIG_HOME/waybar"
hyprctl reload
