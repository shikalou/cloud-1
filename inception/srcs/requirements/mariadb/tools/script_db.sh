#!/bin/sh

echo "Starting MySQL service"
service mysql start

sleep 3

echo "Setting root password"
mysqladmin -u root password ${SQL_ROOT_PASSWORD}

echo "Creating db"
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

echo "Creating user"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

echo "granting privileges to user"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

#mysql -e "ALTER USER 'root'@'%' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
echo "flushing privileges"
mysql -e "FLUSH PRIVILEGES;"
echo "shutting down mysql service"
mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown
#mysqladmin --user=root --password=${SQL_ROOT_PASSWORD} shutdown

sleep 3

echo "start mysql server"
exec mysqld_safe
