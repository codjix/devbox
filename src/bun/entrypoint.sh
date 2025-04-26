#!/bin/sh

/devbox/entrypoint.sh echo ""

# Prepare software
if [ -f /devbox/bun.tar.xz ]; then
  tar xf /devbox/bun.tar.xz -C $BUN_INSTALL_BIN
  ln -s $BUN_INSTALL_BIN/bun $BUN_INSTALL_BIN/bunx
  rm -rf /devbox/bun.tar.xz
fi

# Run current
if [ $# -eq 0 ]; then
  su-exec devbox fish
fi

# Run next
su-exec devbox "$@"