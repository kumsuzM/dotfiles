#!/bin/sh

# get image from specified directory
wall="~/.config/wall.jpg"

# set wallpaper
xwallpaper --zoom "$wall"

# Generate colour scheme
wal -c 
wal -i "$wall"
