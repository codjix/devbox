#!/bin/sh

# prepare and install pkgs with main enterpoint
# change core to the tag you use
if [ -d /app/pkgs ]; then
  sh /app/core/entrypoint.sh
fi

# prepare your source
if [ -f /app/custom/install ]; then
  printf "[3] Prapare custom setup"

  # configure and prepare 
  rc-status -s > /dev/null 2>&1
  touch /run/openrc/softlevel

  rm /app/custom/install
  printf "\n[DONE] Prapare custom setup\n"
fi

# run sub pkgs before shell starts
# or extending another image
rc-service dnsmasq restart > /dev/null 2>&1

# use shell if passed to entrypoint.sh
if [ $1 ]; then
  printf "\n"
  sh -c "$@"
fi
