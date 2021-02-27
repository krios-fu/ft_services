FROM        alpine:3.12.1

RUN         apk --no-cache add \
            php7 \
            php7-mysqli \
            php7-json \
            php7-mbstring \
            php7-fpm \
            php7-opcache \
            nginx

RUN         adduser -D -g 'www' www && \
		    mkdir -p /run/nginx www

RUN		    chown -R www:www /var/lib/nginx && \
		    chown -R www:www /www

RUN         wget http://wordpress.org/latest.tar.gz \
            && tar -xzvf latest.tar.gz \
            && rm latest.tar.gz \
            && mv /wordpress /www/


COPY 	    nginx.conf /etc/nginx/nginx.conf
COPY        wp-config.php /www/wordpress/wp-config.php
COPY        fpm-pool.conf /etc/php7/fpm-pool.conf
COPY        php.ini /etc/php7/php.ini
COPY        setup.sh ./

RUN 	  chmod +x ./setup.sh

EXPOSE 5050

ENTRYPOINT ./setup.sh   