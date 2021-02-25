FROM	alpine:3.12.1

COPY 	/setup.sh ./

RUN     apk update && \
		apk upgrade && \
		apk add --no-cache nginx && \
		apk add --no-cache openssl && \
		apk	add --no-cache openssh

RUN     adduser -D -g 'www' www && \
		mkdir -p /run/nginx www

RUN	 	chmod 700 /etc/ssl/private && \
		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=SP/ST=Spain/L=Madrid/O=42/CN=127.0.0.1" -keyout /etc/ssl/private/nginx_server.key -out /etc/ssl/certs/nginx_server.crt && \
		openssl dhparam -out /etc/nginx/dhparam.pem 1000

RUN		chown -R www:www /var/lib/nginx && \
		chown -R www:www /www

RUN 	chmod +x ./setup.sh

COPY 	/nginx.conf /etc/nginx/
COPY	/index.html /www/

RUN 	ssh-keygen -A && \
		adduser -D ssh_admin && \
		echo "ssh_admin:0101" | chpasswd

EXPOSE	22 80 443

CMD		./setup.sh