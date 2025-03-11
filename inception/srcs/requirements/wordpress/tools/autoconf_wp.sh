#!/bin/sh

sleep 10 

#cd /var/www/wordpress

#if ! wp core is-installed; then
if [ ! -e /var/wwww/wordpress/wp-config.php ]; then

wp config create	--dbname=$SQL_DATABASE \
			--dbuser=$SQL_USER \
			--dbpass=$SQL_PASSWORD \
			--dbhost=mariadb:3306 \
		       	--path='/var/www/wordpress'\
			--allow-root

wp core install		--url=$DOMAIN_NAME \
			--title="inception" \
			--admin_user=$ADMIN_USER \
			--admin_password=$ADMIN_PASSWORD \
			--admin_email=$ADMIN_EMAIL\
			--allow-root\
		       	--path='/var/www/wordpress'


wp user create		$USER1_LOGIN $USER1_MAIL \
			--role=author \
			--user_pass=$USER1_PASSWORD\
			--allow-root\
		       	--path='/var/www/wordpress'

fi
if [ ! -d /run/php ]; then
	mkdir -p /run/php;
fi

# start the PHP FastCGI Process Manager (FPM) for PHP version 7.3 in the foreground
/usr/sbin/php-fpm7.3 -F
