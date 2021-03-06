FROM alpine:3.12.1

COPY  ./srcs/wordpress.sql ./srcs/my.cnf ./srcs/init_file ./srcs/setup.sh ./

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