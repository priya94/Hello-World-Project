#!/bin/bash


function execute() {
    mysql -ss -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DB" -e "${1}"
}

sleep 20
mysql -ss -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS mydb ;"
execute "CREATE TABLE IF NOT EXISTS messages (id INT, msg varchar(20));"
execute "INSERT IGNORE INTO messages (id, msg) VALUES (1, 'Hello World');"
