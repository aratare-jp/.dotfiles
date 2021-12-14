#!/bin/bash
{
killall -q change_wallpaper
while true; do
    DISPLAY=:0 feh --randomize --bg-fill --no-fehbg ~/Pictures/4k
    sleep 5m
done
} &
