#!/bin/bash

read -p "Installing tools with this script may require sudo. Would you like to continue? [Y/n]" continue
if [ $continue = 'Y' ] || [ $continue = '' ]
  sudo su
then
elif [ $continue = 'n' ]
  echo "Exiting"
  exit 0
else
  echo "Unknown answer"
  exit 1
fi

echo "Updating"
apt-get update
apt-get upgrade

echo "Installing ZSH"
apt-get install zsh

echo "Installing OhMyZSH"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing homebrew"
