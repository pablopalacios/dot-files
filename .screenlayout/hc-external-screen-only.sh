#!/bin/sh
xrandr \
    --output DP-1 --off \
    --output DP-2 --off \
    --output HDMI-1 --off \
    --output HDMI-2 --primary --mode 1920x1200 --pos 0x0 --rotate normal \
    --output eDP-1 --off
