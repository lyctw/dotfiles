#!/bin/bash

if [ ! -f ~/.i3/config ]; then
  ln -s $(pwd)/config ~/.i3/config
fi


if [ ! -f ~/.config/i3/config ]; then
  ln -s $(pwd)/config ~/.config/i3/config
fi

