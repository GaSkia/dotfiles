#!/bin/bash

# this script exports variables respectively for wayland or x11
# #
# if [ $XDG_SESSION_TYPE -eq "wayland" ]; then
    export QT_QPA_PLATFORM="wayland;xcb"
# fi
