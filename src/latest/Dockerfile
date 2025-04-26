# Base image
FROM alpine:edge

# Image inputs
ARG VARIANT="latest"
ARG VERSION=1.0.0

# Image info
LABEL org.opencontainers.image.title="DevBox - ${VARIANT}" \
  org.opencontainers.image.description="DevBox, DevContainers images based on Alpine Linux." \
  org.opencontainers.image.author="Ibrahim Megahed <codjix@gmail.com>" \
  org.opencontainers.image.version="${VERSION}"

# Image setup
WORKDIR /devbox
COPY ./src/latest ./core
RUN apk add --no-cache sudo xz su-exec && \
  mkdir pkgs sh /workspace && \
  apk fetch --no-cache -R -o ./pkgs \
  fish shadow starship git gpg gpg-agent github-cli \
  lsd curl net-tools nmap procps mc nano fastfetch screen ncdu btop && \
  addgroup -g 70 -S devbox && \
  adduser -u 70 -S -D -G devbox -H -h /workspace -s /bin/sh devbox && \
  echo "devbox ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
  chmod 777 ./core/entrypoint.sh

# Final setup
WORKDIR /workspace
ENTRYPOINT [ "/devbox/core/entrypoint.sh" ]
CMD [ "fish" ]