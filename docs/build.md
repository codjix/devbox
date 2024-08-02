# DevBox

## Structure

You can extend any devbox image with this method.

```txt
.
├── .devcontainer.json
├── Dockerfile
└── entrypoint.sh
```

## .devcontainer.json
```json
{
  "name": "DevBox Custom Container",
  // "image": "test:latest", // use if necessary
  "build": {
    "context": ".",
    "dockerfile": "Dockerfile",
    "target": "devcontainer"
  },
  "workspaceFolder": "/workspace",
  "postCreateCommand": "echo 'Container is ready!'",
  "runArgs": ["--entrypoint", "/app/custom/entrypoint.sh", "fish"],
  "forwardPorts": ["3000:3000"],
  "remoteUser": "root"
}
```

## Dockerfile

```dockerfile
FROM tdim/devbox:core

# Image info
LABEL maintainer="Your Name <user@domain.tld>" \
  key="value"

# Image source necessary for build
# it must contain the entrypoint.sh file
# COPY ./path/to/source /app/custom
COPY . /app/custom

# Image pkgs
# do all things reqiures internet here
# keep layers few as match as you can
RUN apk update && \
  # install pkgs that reqiures internet at
  # post install stage of downloaded pkgs
  apk add openrc && \
  # download now, install later
  # keep target /app/pkgs to get extras only
  apk fetch -R -o /app/pkgs dnsmasq && \
  # prepare your entrypoint
  chmod 777 /app/custom/entrypoint.sh && \
  touch /app/custom/install

# make none editable directory as
# as a volume to make it writble
# not recommended
VOLUME [ "/sys/fs/cgroup" ]

# Expose main ports
EXPOSE 53

# Final setup
WORKDIR /workspace
ENTRYPOINT [ "/app/custom/entrypoint.sh" ]
CMD [ "fish" ]
```

## entrypoint.sh

```sh
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
```
