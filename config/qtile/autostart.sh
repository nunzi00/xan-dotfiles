#!/bin/sh

# rearrange keyboard map
setxkbmap -layout us -variant altgr-intl

# rearrange three monitors
xrandr --output DP-0 --auto --output DP-2 --auto --left-of DP-0 --output DP-4 --auto --right-of DP-0

# systray volume
volumeicon &
