#!/bin/sh

# Prepare software
if [ -d /devbox/pkgs ]; then
  USERDIR="/workspace"
  COREDIR="/devbox/core"
  echo "[*] Installing packages..."
  apk add --no-network /devbox/pkgs/*.apk > /dev/null 2>&1
  rm -rf /devbox/pkgs
  echo "[*] Setup configrations..."
  chsh -s /usr/bin/fish devbox
  mkdir -p $USERDIR/.config/fish
  cat $COREDIR/config.fish > $USERDIR/.config/fish/config.fish
  chmod +x $USERDIR/.config/fish/config.fish
  cat $COREDIR/starship.toml > $USERDIR/.config/starship.toml
  chown -R devbox:devbox $USERDIR
fi

# Run current
if [ $# -eq 0 ]; then
  su-exec devbox fish
fi

# Run next
su-exec devbox "$@"