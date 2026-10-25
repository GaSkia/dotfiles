#!/bin/bash

sed -i "s|\blocal workdir =|local workdir = $(pwd)|g" "$XDG_CONFIG_HOME/hypr/remap.lua"
