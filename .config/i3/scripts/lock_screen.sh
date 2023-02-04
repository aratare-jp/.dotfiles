#!/bin/bash
random_wallpaper=$(ls -d ~/Pictures/3440x1440/* | shuf -n 1)
convert $random_wallpaper RGB:- | i3lock --nofork -u --raw 3440x1440:rgb --image /dev/stdin
