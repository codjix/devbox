FROM tdim/devbox:core

# Image info
LABEL maintainer="Ibrahim Megahed <tdim.dev@gmail.com>" \
  org.opencontainers.image.title="devbox node" \
  org.opencontainers.image.description="The official DevBox node environment with popular linux tools on Alpine-Linux." \
  org.opencontainers.image.authors="Ibrahim Megahed <tdim.dev@gmail.com>" \
  org.opencontainers.image.version="1.0.0" \
  build="2-Aug-2024"

# Image source
COPY ./src/node /app/node

# Image pkgs
RUN apk update && \
  wget https://registry.npmjs.org/pnpm/-/pnpm-9.5.0.tgz -O /app/node/pnpm.tgz && \
  apk fetch -R -o /app/pkgs nodejs-current npm icu-data-full && \
  chmod 777 /app/node/entrypoint.sh && \
  touch /app/node/install

# Final setup
WORKDIR /workspace
ENTRYPOINT [ "/app/node/entrypoint.sh" ]
CMD [ "fish" ]