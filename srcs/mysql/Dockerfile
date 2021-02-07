FROM		alpine:latest

RUN 		apk add --no-cache mariadb mariadb-client

COPY 		./wordpress.sql ./
COPY 		./configbase.sql ./
COPY		./setup.sh ./

RUN 		mkdir -p /run/mysqld 
COPY 		./init.cnf /etc/

RUN 		chmod +x ./setup.sh

EXPOSE		3306

CMD 		./setup.sh