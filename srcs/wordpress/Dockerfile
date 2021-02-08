FROM alpine:latest

COPY wp-config.php ./


RUN apk update && \
	apk add --no-cache php7 php7-fpm php7-opcache php7-gd php7-mysqli \
	php7-zlib php7-curl php7-mbstring php7-json php7-session


ADD https://wordpress.org/latest.tar.gz .


RUN tar -xvf latest.tar.gz && \
	mv /wordpress /var/www/ && \
	mv wp-config.php /var/www/wordpress && \
	rm -f latest.tar.gz


EXPOSE 80

CMD php -S 0.0.0.0:5050 -t /var/www/