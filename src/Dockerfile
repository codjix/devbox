# Base image
FROM alpine:latest

# Image inputs
ARG VARIANT="latest"
ARG VERSION=1.0.0

# Image info
LABEL org.opencontainers.image.title="DevBox - ${VARIANT}" \
  org.opencontainers.image.description="DevContainers images based on Alpine Linux." \
  org.opencontainers.image.author="Ibrahim Megahed <codjix@gmail.com>" \
  org.opencontainers.image.version="${VERSION}"

# Add source code
COPY ./src /opt/devbox

# Add dependencies
RUN apk add --no-cache sudo su-exec
RUN mkdir -p /opt/devbox/pkgs && apk fetch --no-cache -R -o /opt/devbox/pkgs \
  curl wget nano procps net-tools screen ncdu btop lsd jq tree \
  p7zip xz zip git github-cli openssl fastfetch fish nmap mc

# Setup workspace and user
RUN addgroup -g 1000 codespace && \
  adduser -u 1000 -D -G codespace -h /workspaces codespace && \
  echo "codespace ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
  chmod +x /opt/devbox/entrypoint.sh

# Final setup
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
WORKDIR /workspaces

ENTRYPOINT [ "/opt/devbox/entrypoint.sh" ]
CMD [ "fish" ]