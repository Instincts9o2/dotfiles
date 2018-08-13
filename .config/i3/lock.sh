#!/usr/bin/env bash

icon="/home/instincts/.config/i3/lock.png"
tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
i3lock -u -i "$tmpbg"
# LUKE'S SCRIPT
# #!/bin/bash
# scrot /tmp/screen.png
# #convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
# #convert /tmp/screen.png -paint 3 -modulate 80 /tmp/screen.png
# convert /tmp/screen.png -paint 3 -swirl 180 /tmp/screen.png
# [[ -f ~/.config/i3/lock.png ]] && convert /tmp/screen.png  ~/.config/i3/lock.png -gravity center -composite -matte /tmp/screen.png
# mocp -P
# i3lock -u -e -i /tmp/screen.png
