FROM alpine:3.12.1


RUN    apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache 

COPY       grafana.db /usr/share/grafana/data/grafana.db

WORKDIR	/usr/share/grafana

EXPOSE 3000

ENTRYPOINT grafana-server