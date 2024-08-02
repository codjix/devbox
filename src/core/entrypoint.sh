#!/bin/sh

if [ -d /app/pkgs ]; then
  clear
  printf "\n[1] Install Local Packages"
  apk add --no-network /app/pkgs/*.apk > /dev/null 2>&1
  rm -rf /app/pkgs
  printf "\n[DONE] Install Local Packages"
fi

if [ -f /app/core/install ]; then
  printf "\n[2] Prapare Core"
  mkdir -p /root/.config/fish/functions
  cp /app/core/fish_prompt.fish /root/.config/fish/functions/fish_prompt.fish
  rm /app/core/install
  printf "\n[DONE] Prapare Core \n"
fi

if [ $1 ]; then
  printf "\n"
  sh -c "$@"
fi