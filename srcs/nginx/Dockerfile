FROM	alpine:3.12.1

COPY 	./srcs/setup.sh ./

RUN     apk update && \
		apk upgrade && \
		apk add --no-cache nginx  php7-fpm \
			php7 \
            php7-mysqli \
            php7-json \
            php7-mbstring \
            php7-fpm \
            php7-opcache \
			php \
			openssl

RUN     adduser -D -g 'www' www && \
		mkdir -p /run/nginx www

RUN	 	chmod 700 /etc/ssl/private && \
		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=SP/ST=Spain/L=Madrid/O=42/CN=127.0.0.1" -keyout /etc/ssl/private/nginx_server.key -out /etc/ssl/certs/nginx_server.crt && \
		openssl dhparam -out /etc/nginx/dhparam.pem 1000

RUN		chown -R www:www /var/lib/nginx && \
		chown -R www:www /www

RUN 	chmod +x ./setup.sh

COPY 	./srcs/nginx.conf /etc/nginx/
COPY	./srcs/index.php /www/
COPY	./srcs/index.css /www/

EXPOSE	80 443

CMD		./setup.sh