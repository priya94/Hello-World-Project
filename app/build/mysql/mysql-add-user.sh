#!/bin/bash

set -e

if [ ! -z "$MYSQL_ROOT_PASSWORD" ] && [ ! -z "$MYSQL_USER" ] && [ ! -z "$MYSQL_PASSWORD" ] && [ ! -z "$MYSQL_DB_HOST" ]; then
  mysql --protocol=socket -uroot -p$MYSQL_ROOT_PASSWORD <<EOSQL
  CREATE USER IF NOT EXISTS '$MYSQL_USER'@'$MYSQL_DB_HOST' IDENTIFIED BY '$MYSQL_PASSWORD';
  GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'$MYSQL_DB_HOST';
EOSQL
  if [ $? ]; then echo "New mysql users have been created and granted all the permissions!!!"; fi
else
  echo "Warning: Not all variables were set, won't create new user."
fi
