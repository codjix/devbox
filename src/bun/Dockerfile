# Base image
FROM codjix/devbox:latest

# Image inputs
ARG VARIANT="bun"
ARG VERSION=1.2.10

# Image info
LABEL org.opencontainers.image.title="DevBox - ${VARIANT}" \
  org.opencontainers.image.description="DevBox, DevContainers images based on Alpine Linux." \
  org.opencontainers.image.author="Ibrahim Megahed <codjix@gmail.com>" \
  org.opencontainers.image.version="${VERSION}"

# Image config
# Disable the runtime transpiler cache by default inside Docker containers.
# On ephemeral containers, the cache is not useful
ARG BUN_RUNTIME_TRANSPILER_CACHE_PATH=0
ENV BUN_RUNTIME_TRANSPILER_CACHE_PATH=${BUN_RUNTIME_TRANSPILER_CACHE_PATH}
# Ensure `bun install -g` works
ARG BUN_INSTALL_BIN=/usr/local/bin
ENV BUN_INSTALL_BIN=${BUN_INSTALL_BIN}

# Image setup
COPY ./src/${VARIANT}/entrypoint.sh /devbox/sh/${VARIANT}.sh
RUN apk fetch --no-cache -R -o /devbox/pkgs libgcc libstdc++ && \
  export ARCH=$([ "$(uname -m)" = "x86_64" ] && echo "x64" || echo "aarch64") && \
  wget https://github.com/oven-sh/bun/releases/download/bun-v${VERSION}/bun-linux-${ARCH}-musl.zip && \
  unzip bun-linux-*-musl.zip && cd bun-linux-*-musl && \
  tar cv bun | xz -f9 -T0 > /devbox/bun.tar.xz && \
  cd .. && rm -rf bun-linux-*-musl* && \
  chmod 777 /devbox/sh/${VARIANT}.sh

ENTRYPOINT [ "/devbox/sh/bun.sh" ]