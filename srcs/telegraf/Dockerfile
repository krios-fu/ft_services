FROM    alpine:3.12.1

COPY    ./setup.sh ./

# Install telegraf for monitoring
RUN mkdir /etc/telegraf \
&& wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.3_linux_amd64.tar.gz \
&& tar xf telegraf-1.17.3_linux_amd64.tar.gz \
&& chmod +x telegraf/* \
&& cp telegraf/telegraf /usr/bin/ \
&& rm -rf *.tar.gz* telegraf/ \
&& rm -rf /var/cache/apk/*

COPY telegraf.conf /etc/telegraf/telegraf.conf
COPY setup.sh .

RUN chmod +x setup.sh

EXPOSE 4999

CMD ./setup.sh