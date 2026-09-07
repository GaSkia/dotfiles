#!/bin/zsh
killall waybar
killall hyprpaper
if [[ $USER = "gaskia" ]]
then
    waybar -c ~/.config/waybar/config.jsonc & -s ~/.config/waybar/style.css
else
    waybar &
fi

hyprpaper &
