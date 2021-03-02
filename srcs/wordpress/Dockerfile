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
            
            # Worpress 
RUN         wget http://wordpress.org/latest.tar.gz \
            && tar -xzvf latest.tar.gz \
            && rm latest.tar.gz \
            && mv /wordpress /www/

            # Archivos de configuracion
COPY 	    nginx.conf /etc/nginx/nginx.conf
COPY        wp-config.php /www/

COPY        setup.sh ./
            # Permisos de ejecucion del script
RUN 	    chmod +x ./setup.sh

EXPOSE 5050

ENTRYPOINT ./setup.sh   