# DevBox

DevContainers images based on Alpine Linux.

## Quick Start

Start the core image:

```bash
docker run --rm -it codjix/devbox:latest
```

Start the Docker image with access to the host Docker daemon:

```bash
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock codjix/devbox:docker
```

## Variants

| Tag | Description |
| --- | --- |
| `latest` | Core image with common development tools. |
| `docker` | Core image with Docker CLI and Docker Compose. |

## What's Included

- **System:** `alpine` `sudo` `su-exec` `fish`
- **Development:** `git` `github-cli` `curl` `wget` `jq` `openssl`
- **Utilities:** `nano` `tree` `btop` `ncdu` `lsd` `mc` `screen`
- **Extras:** `nmap` `procps` `net-tools` `p7zip` `zip`
- **Docker:** `docker-cli` `docker-compose`

## Build

```bash
./build.sh latest
./build.sh docker
```

## License

[MIT License](./LICENSE)
