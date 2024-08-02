#!/bin/sh

if [ -d /app/pkgs ]; then
  sh /app/core/entrypoint.sh
fi

if [ -f /app/php/install ]; then
  printf "[3] Prapare PHP"

  cat << EOF > /etc/php83/conf.d/custom.ini
max_file_uploads = 1024
upload_max_filesize = 1024M
post_max_size = 1024M
EOF
  sed -i "/LoadModule rewrite_module/s/^#//g" /etc/apache2/httpd.conf
  sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/httpd.conf

  rm /app/php/install
  printf "\n[DONE] Prapare PHP \n"
fi

if [ $1 ]; then
  printf "\n"
  sh -c "$@"
fi
