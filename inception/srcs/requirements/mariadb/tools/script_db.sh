#!/bin/sh
service mysql start

sleep 3

mysqladmin -u root password ${SQL_ROOT_PASSWORD}

mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

#mysql -e "ALTER USER 'root'@'%' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown
#mysqladmin --user=root --password=${SQL_ROOT_PASSWORD} shutdown

sleep 3

exec mysqld_safe
