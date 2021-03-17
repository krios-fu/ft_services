FROM 	    alpine:3.12.1

COPY        ./srcs/setup.sh ./
RUN  	    apk add influxdb --repository https://dl.influxdata.com/influxdb/releases/influxdb2-2.0.4-linux-amd64.tar.gz --allow-untrusted --no-cache 

RUN         chmod +x ./setup.sh

EXPOSE      8086

CMD         ./setup.sh

ENTRYPOINT  /usr/sbin/influxd -config etc/influxdb.conf


