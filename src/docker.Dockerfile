# Image inputs
ARG VARIANT="docker"
ARG VERSION=1.0.0

# Base image
FROM codjix/devbox:${VERSION}

# Image info
LABEL org.opencontainers.image.title="DevBox - ${VARIANT}" \
  org.opencontainers.image.description="DevContainers images based on Alpine Linux." \
  org.opencontainers.image.author="Ibrahim Megahed <codjix@gmail.com>" \
  org.opencontainers.image.version="${VERSION}"

# Add dependencies
RUN apk fetch --no-cache -R -o /opt/devbox/pkgs docker-cli docker-compose

# Final setup
ENV DEVBOX_DOCKER=true