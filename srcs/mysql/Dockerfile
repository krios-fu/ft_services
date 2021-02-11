FROM alpine:3.12.1

COPY  wordpress.sql my.cnf init_file setup.sh ./

# Install MySQL and dependencies
RUN apk update && \
	apk add --no-cache mysql mysql-client

# Setup MySQL
RUN mkdir -p /run/mysqld && \
    chown -R root:root /run/mysqld && \
	mv my.cnf /etc/

RUN 	chmod +x ./setup.sh

EXPOSE 3306

CMD ./setup.sh