FROM	debian:bookworm

RUN		apt update -y && apt upgrade -y

RUN apt-get install -y wget \
    php-cli \
    php-fpm \
    php-mysql \
    mariadb-client

RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp && wp --info

# RUN		apt-get update && apt-get install -y default-mysql-client
RUN		wget https://fr.wordpress.org/wordpress-6.2-fr_FR.tar.gz -P /var/www/
RUN		cd /var/www && tar -xzf wordpress-6.2-fr_FR.tar.gz && rm -f wordpress-6.2-fr_FR.tar.gz

#RUN		chown -R root:root /var/www/wordpress
RUN		chown -R www-data:www-data /var/www/*
RUN		chmod -R 755 /var/www/*

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/

EXPOSE	9000

COPY tools/autoconf_wp.sh /usr/local/bin/autoconf_wp.sh

RUN chmod +x /usr/local/bin/autoconf_wp.sh

ENTRYPOINT [ "/usr/local/bin/autoconf_wp.sh" ]
