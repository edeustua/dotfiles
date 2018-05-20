#!/bin/bash

# This script allows sxhkd to change desktops and move nodes.

monitor=$(bspc query -M -m) # Current monitor
desktop=$2 # Target desktop

# Debugging line
#echo bspc desktop -f "$monitor/^$desktop" >> /tmp/test-sxhkd
case "$1" in
    1) # Focus desktop
        if [ -n "$(bspc query -D -d "$monitor:^$desktop.focused")" ]; then
            bspc desktop -f last.local
        else
            bspc desktop -f "$monitor:^$desktop"
        fi
        ;;
    2) # Move node to desktop
        bspc node -d "$monitor:^$desktop"
esac
