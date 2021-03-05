FROM 	    alpine:3.12.1

COPY        setup.sh ./
RUN  	    apk add influxdb --repository https://dl.influxdata.com/influxdb/releases/influxdb2-2.0.4-linux-amd64.tar.gz --allow-untrusted --no-cache 

RUN         chmod +x ./setup.sh

EXPOSE      8086

ENTRYPOINT  ./setup.sh  


