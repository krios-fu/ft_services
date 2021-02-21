FROM	alpine:3.12.1

RUN 	apk update && \
		apk add --no-cache vsftpd openssl

RUN 	mkdir -p /etc/ftps/ftp_admin && \
		adduser --home=/etc/fpts/ftp_admin -D ftp_admin && \
		echo "ftp_admin:01010" | chpasswd

COPY	vsftpd.conf /etc/vsftpd/ 

RUN 	echo "ftp_admin" >> /etc/vsftpd/vsftpd.userlist

RUN 	openssl req -new -newkey rsa:2048 -nodes -days 365 -x509 \
		-subj "/C=SP/ST=Spain/L=Madrid/O=42/CN=127.0.0.1" \
		-keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt

EXPOSE	20 21

ENTRYPOINT /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf