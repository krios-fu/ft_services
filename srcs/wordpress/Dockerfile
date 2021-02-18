FROM	alpine:3.12.1

COPY	wp-config.php setup.sh ./

RUN		apk update && apk add wget \
		&& apk add php7 php7-fpm php7-mysqli php7-mbstring php7-json

RUN 	wget https://wordpress.org/latest.tar.gz \
		&& tar -xvf latest.tar.gz \
		&& rm latest.tar.gz \
		&& mv wordpress /www \
		&& mv wp-config.php /www/

RUN 	chmod +x ./setup.sh

EXPOSE 	5050

CMD		./setup.sh
