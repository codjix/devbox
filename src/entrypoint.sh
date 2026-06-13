#!/bin/sh

# Prepare software
if [ -d /opt/devbox/pkgs ]; then
  echo "[+] Installing packages..."
  apk add --no-network /opt/devbox/pkgs/*.apk > /dev/null 2>&1
  rm -rf /opt/devbox/pkgs

  echo "[+] Setting up configurations..."
  fish -c "fish_config prompt choose nim && echo y | fish_config prompt save" > /dev/null 2>&1
  cat /opt/devbox/config.fish > /root/.config/fish/config.fish
  cp -r /root/.config /workspaces/.config
  chown -R codespace:codespace /workspaces

  if [ -n "$DEVBOX_DOCKER" ]; then
    echo "[+] Setting up Docker..."
    DOCKER_GID="$(stat -c '%g' /var/run/docker.sock 2>/dev/null || true)"
    addgroup -g "$DOCKER_GID" -S docker 2>/dev/null
    addgroup codespace docker 2>/dev/null
  fi

  echo "[+] Done!"
fi

# Run next
su-exec codespace "$@"