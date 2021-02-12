FROM alpine:3.12.1

COPY wp-config.php ./ 


RUN apk update && \
	apk add --no-cache php7 php7-fpm php7-opcache php7-gd php7-mysqli \
	php7-zlib php7-curl php7-mbstring php7-json php7-session


ADD https://wordpress.org/latest.tar.gz .



RUN		mkdir -p /var/www/ && \
		chmod 755 /var/www/ && \
		chmod 755 -R /var/www/ && \
		mv wp-config.php /var/www/

RUN 	tar -xvf latest.tar.gz  --strip-components=1 -C /var/www/ && \
		rm -f latest.tar.gz

EXPOSE 5050

CMD /usr/bin/php -S 0.0.0.0:5050 -t var/www/