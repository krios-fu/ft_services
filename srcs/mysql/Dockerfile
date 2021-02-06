FROM		alpine:latest

RUN 		apk add --no-cache mariadb \
			mariadb-client \
			mysql

COPY 		./configbase.sql ./etc/
COPY 		./wordpress.sql ./

RUN 		mkdir -p /run/mysqld \
       		&& chown -R root:root /run/mysqld \

EXPOSE		3306

CMD 		mysql -uroot -p mysql < ./etc/configbase.sql 
ENTRYPOINT  mariadb-install-db --datadir="/var/lib/mysql" tail -f /dev/null