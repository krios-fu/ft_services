FROM alpine:3.12.1

RUN apk update && apk add wget \
&& apk add php7 php7-fpm php7-mysqli php7-mbstring php7-json

RUN wget https://wordpress.org/latest.tar.gz \
&& tar -xzvf latest.tar.gz \
&& rm latest.tar.gz \
&& mkdir -p /var/www  \
&& mv /wordpress /var/www

COPY wp-config.php /var/www/wordpress/

EXPOSE 5050

ENTRYPOINT php -S 0.0.0.0:5050 -t /var/www/wordpress/
