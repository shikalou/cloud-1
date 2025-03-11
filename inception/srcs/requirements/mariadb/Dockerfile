FROM	debian:buster

RUN		apt update -y && apt upgrade -y
RUN		apt-get install mariadb-server -y

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

#RUN mkdir -p /var/run/mysqld
#RUN mkdir -p /var/lib/mysql
#RUN chown mysql:mysql /var/run/mysqld/
#RUN chmod -R 755 /var/run/mysqld/
#RUN chown mysql:mysql /var/lib/mysql/
#RUN chmod -R 755 /var/lib/mysql/
#RUN		mysql_install_db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal --skip-test-db
#EXPOSE	3306

COPY	tools/script_db.sh . 
RUN	chmod +x ./script_db.sh

ENTRYPOINT [ "./script_db.sh"]
