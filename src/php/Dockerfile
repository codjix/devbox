# Base image
FROM codjix/devbox:latest

# Image inputs
ARG VARIANT="php"
ARG VERSION=8.4.6

# Image info
LABEL org.opencontainers.image.title="DevBox - ${VARIANT}" \
  org.opencontainers.image.description="DevBox, DevContainers images based on Alpine Linux." \
  org.opencontainers.image.author="Ibrahim Megahed <codjix@gmail.com>" \
  org.opencontainers.image.version="${VERSION}"

# Image setup
RUN apk fetch --no-cache -R -o /devbox/pkgs apache2 composer php84 \
  php-apache2 php-curl php-gd php-zip php-mbstring php-mysqli php-pdo_mysql php-sodium \
  php-ctype php-session php-xml php-json php-iconv php-sqlite3 php-pdo_sqlite
