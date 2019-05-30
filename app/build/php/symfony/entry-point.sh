#!/bin/bash

if [ ! -d "/app/var" ]; then
  mkdir -p /app/var
fi

chown -R www-data:www-data /app/var
#bin/console cache:clear
mkdir -p /run/php

/etc/init.d/php7.1-fpm start &
sleep infinity
