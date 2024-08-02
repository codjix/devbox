FROM tdim/devbox:core

# Image info
LABEL maintainer="Ibrahim Megahed <tdim.dev@gmail.com>" \
  org.opencontainers.image.title="devbox php" \
  org.opencontainers.image.description="The official DevBox php environment with popular linux tools on Alpine-Linux." \
  org.opencontainers.image.authors="Ibrahim Megahed <tdim.dev@gmail.com>" \
  org.opencontainers.image.version="1.0.0" \
  build="2-Aug-2024"

# Image source
COPY ./src/php /app/php

# Image pkgs
RUN apk update && \
  apk fetch -R -o /app/pkgs apache2 composer php83 \
  php-apache2 php-curl php-gd php-zip php-mbstring php-mysqli php-pdo_mysql php-sodium \
  php-ctype php-session php-xml php-json php-iconv php-sqlite3 php-pdo_sqlite && \
  chmod 777 /app/php/entrypoint.sh && \
  touch /app/php/install

# Final setup
WORKDIR /workspace
ENTRYPOINT [ "/app/php/entrypoint.sh" ]
CMD [ "fish" ]