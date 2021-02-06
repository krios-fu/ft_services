FROM		alpine:latest

COPY		/setup.sh ./

RUN 		apk add --no-cache phpmyadmin

COPY		/config.inc.php /www/
RUN 		chmod +x ./setup.sh

EXPOSE		5000

CMD			./setup.sh