#!/bin/sh

sleep 10 

wp --info
#if ! wp core is-installed; then
echo "Checking if wp-config.php exists..."
if [ ! -e /var/www/wordpress/wp-config.php ]; then
	echo "wp-config.php does not exist. Creating..."
	# wp config create \
	# 			--dbname=$SQL_DATABASE \
	# 			--dbuser=$SQL_USER \
	# 			--dbpass=$SQL_PASSWORD \
	# 			--dbhost=mariadb:3306 \
	# 			--path='/var/www/wordpress'\
	# 			--allow-root
	sed -i "s/votre_nom_de_bdd/$SQL_DATABASE/g" /var/www/wordpress/wp-config-sample.php
	sed -i "s/votre_utilisateur_de_bdd/$SQL_USER/g" /var/www/wordpress/wp-config-sample.php
	sed -i "s/votre_mdp_de_bdd/$SQL_PASSWORD/g" /var/www/wordpress/wp-config-sample.php
	sed -i "s/localhost/mariadb:3306/g" /var/www/wordpress/wp-config-sample.php
	cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
	# rm /var/www/wordpress/wp-config-sample.php

	echo "Installing WordPress core..."
	wp core install \
				--url=$DOMAIN_NAME \
				--title="inception" \
				--admin_user=$ADMIN_USER \
				--admin_password=$ADMIN_PASSWORD \
				--admin_email=$ADMIN_EMAIL\
				--path='/var/www/wordpress' \
				--allow-root

	echo "Creating user..."
	wp user create		$USER1_LOGIN $USER1_MAIL \
				--role=author \
				--user_pass=$USER1_PASSWORD\
				--allow-root\
					--path='/var/www/wordpress'
else
	echo "wp-config.php already exists."
fi

if [ ! -d /run/php ]; then
	mkdir -p /run/php;
fi

echo "Starting PHP-FPM..."
# start the PHP FastCGI Process Manager (FPM) for PHP version 7.3 in the foreground
/usr/sbin/php-fpm7.3 -F
