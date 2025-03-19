FROM		debian:buster

RUN		apt update -y && apt upgrade -y

RUN		mkdir -p /etc/nginx/ssl
RUN		mkdir -p /var/run/nginx
RUN		mkdir -p /var/log/nginx

RUN		apt install nginx \
		vim \
		curl \
		openssl -y

RUN		openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=/4.233.145.114UID=ldinaut"

COPY		conf/nginx.conf /etc/nginx/nginx.conf
RUN		chmod 755 /var/www/html
RUN		chown -R www-data:www-data /var/www/html
EXPOSE		443	
ENTRYPOINT	["nginx", "-g", "daemon off;"]
