FROM        alpine:3.12.1

RUN         apk add phpmyadmin
COPY        ./config.inc.php /etc/phpmyadmin/config.inc.php
EXPOSE		5000
ENTRYPOINT  php -S 0.0.0.0:5000 -t /usr/share/webapps/phpmyadmin