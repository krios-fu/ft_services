FROM	alpine:3.12.1

RUN 	apk update && \
		apk add --no-cache vsftpd openssl

RUN 	mkdir -p /etc/ftps/admin && \
		adduser --home=/etc/ftps/admin -D admin && \ 
		echo "admin:0101" | chpasswd

COPY 	vsftpd.conf /etc/vsftpd/vsftpd.conf

#RUN 	echo "admin" >> /etc/vsftpd.user_list

RUN 	openssl req -new -newkey rsa:2048 -nodes -days 365 -x509 \
		-subj "/C=SP/ST=Spain/L=Madrid/O=42/CN=127.0.0.1" \
		-keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt

EXPOSE	21 30021

ENTRYPOINT /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf