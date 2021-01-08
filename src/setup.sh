#!/bin/bash

./symlink.sh
./aptinstall.sh
./programs.sh

# Get all upgrades
sudo apt upgrade -y

# See bash changes
# source ~/.bashrc

# Hello World
figlet "... Dotfiles configured!" | lolcat

echo "Then configure zsh manually.."
