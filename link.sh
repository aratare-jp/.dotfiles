#!/bin/bash

rm -rf ~/.config/i3
ln -s $(pwd)/.config/i3 ~/.config/i3

rm -rf ~/.config/polybar
ln -s $(pwd)/.config/polybar ~/.config/polybar

rm -rf ~/.config/dunst
ln -s $(pwd)/.config/dunst ~/.config/dunst

rm -rf ~/.config/rofi
ln -s $(pwd)/.config/rofi ~/.config/rofi

