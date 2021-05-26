#!/bin/bash

~/Apps/Obsidian-0.11.13.AppImage &
if [ "$?" -eq 0 ]
then
  echo "Obsidian is running!"
  exit 0
else
  echo "Failed to launch Obsidian"
  exit 1
fi

