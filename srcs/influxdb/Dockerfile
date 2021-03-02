FROM 	    alpine:3.12.1

COPY        setup.sh ./
RUN  	    apk add --no-cache influxdb

RUN         chmod +x ./setup.sh

EXPOSE      8088

WORKDIR     /usr/bin
CMD         influx  \n CREATE DATABASE grafana \n \
            CREATE USER kriosfu WITH PASSWORD kriosfu \n \
            GRANT ALL ON grafana TO kriosfu


ENTRYPOINT  /usr/sbin/influxd


