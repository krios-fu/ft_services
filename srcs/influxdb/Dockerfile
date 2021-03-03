FROM 	    alpine:3.12.1

COPY        setup.sh ./
RUN  	    apk add --no-cache influxdb

RUN         chmod +x ./setup.sh

EXPOSE      8086

ENTRYPOINT  /usr/sbin/influxd


