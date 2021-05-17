#!/bin/bash
set -x

mkdir pkgs
cd pkgs

wget 'https://github.com/sharkdp/bat/releases/download/v0.18.1/bat_0.18.1_amd64.deb' && echo "bat has been downloaed."
wget 'https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb' && echo "ripgrep has been downloaed."
wget 'https://github.com/sharkdp/fd/releases/download/v8.2.1/fd_8.2.1_amd64.deb' && echo "fd has been downloaed."

if [ -f bat*.deb ]; then
    sudo dpkg -i bat*.deb
else
    echo "Installing `bat`, no such file."
    exit 1
fi


if [ -f ripgrep*.deb ]; then
    sudo dpkg -i ripgrep*.deb
else
    echo "Installing `ripgrep`, no such file."
    exit 1
fi

if [ -f fd*.deb ]; then
    sudo dpkg -i fd*.deb
else
    echo "Installing `fd`, no such file."
    exit 1
fi

cd ..
rm -rf pkgs

echo "Packages installed successfully."
exit 0
