FROM alpine:3.20

# Image info
LABEL maintainer="Ibrahim Megahed <tdim.dev@gmail.com>" \
  org.opencontainers.image.title="devbox core" \
  org.opencontainers.image.description="The official DevBox core environment with popular linux tools on Alpine-Linux." \
  org.opencontainers.image.authors="Ibrahim Megahed <tdim.dev@gmail.com>" \
  org.opencontainers.image.version="1.0.0" \
  build="2-Aug-2024"

# Image source
COPY ./src/core /app/core

# Image pkgs
RUN apk update && \
  mkdir -p /app/pkgs && \
  apk fetch -R -o /app/pkgs btop curl fish git mc nano neofetch net-tools nmap screen xz && \
  chmod 777 /app/core/entrypoint.sh && \
  touch /app/core/install

# Final setup
WORKDIR /workspace
ENTRYPOINT [ "/app/core/entrypoint.sh" ]
CMD [ "fish" ]