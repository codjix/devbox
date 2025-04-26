# Base image
FROM codjix/devbox:latest

# Image inputs
ARG VARIANT="node"
ARG VERSION=23.11.0

# Image info
LABEL org.opencontainers.image.title="DevBox - ${VARIANT}" \
  org.opencontainers.image.description="DevBox, DevContainers images based on Alpine Linux." \
  org.opencontainers.image.author="Ibrahim Megahed <codjix@gmail.com>" \
  org.opencontainers.image.version="${VERSION}"

# Image setup
RUN apk fetch --no-cache -R -o /devbox/pkgs nodejs-current npm
