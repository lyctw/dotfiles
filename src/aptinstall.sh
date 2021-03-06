#!/bin/bash

sudo apt update

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

install curl
install ffmpeg
install git
install openssh-server
install htop
install nmap
install tmux
install vim
install figlet
install lolcat
