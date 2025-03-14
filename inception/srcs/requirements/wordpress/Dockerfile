FROM	debian:buster

RUN		apt update -y && apt upgrade -y

# RUN		apt-get install -y wget \
# 		php7.3 -y \
# 		php-fpm -y \
# 		php-mysql -y \
# 		mariadb-client -y

RUN apt-get install -y wget \
	php7.3-cli \
	php7.3-fpm \
	php7.3-mysql \
	mariadb-client

RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp && wp --info

# RUN		apt-get update && apt-get install -y default-mysql-client
RUN		wget https://fr.wordpress.org/wordpress-6.2-fr_FR.tar.gz -P /var/www/
RUN		cd /var/www && tar -xzf wordpress-6.2-fr_FR.tar.gz && rm -f wordpress-6.2-fr_FR.tar.gz

#RUN		chown -R root:root /var/www/wordpress
RUN		chown -R www-data:www-data /var/www/*
RUN		chmod -R 755 /var/www/*

COPY	conf/www.conf /etc/php/7.3/fpm/pool.d/

EXPOSE	9000

COPY tools/autoconf_wp.sh /usr/local/bin/autoconf_wp.sh

RUN chmod +x /usr/local/bin/autoconf_wp.sh

ENTRYPOINT [ "/usr/local/bin/autoconf_wp.sh" ]
