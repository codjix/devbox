#!/bin/sh

if [ -d /app/pkgs ]; then
  sh /app/core/entrypoint.sh
fi

if [ -f /app/node/install ]; then
  printf "[3] Prapare NodeJS"
  DIR="/usr/local/lib/node_modules"
  mkdir -p $DIR

  tar xf /app/node/pnpm.tgz -C $DIR
  mv $DIR/package $DIR/pnpm
  ln -s $DIR/pnpm/bin/pnpm.cjs /usr/local/bin/pnpm
  ln -s $DIR/pnpm/bin/pnpx.cjs /usr/local/bin/pnpx

  env SHELL="fish" /usr/local/bin/pnpm setup > /dev/null 2>&1
  source /root/.config/fish/config.fish

  rm /app/node/install /app/node/pnpm.tgz
  printf "\n[DONE] Prapare NodeJS \n"
fi

if [ $1 ]; then
  printf "\n"
  sh -c "$@"
fi
