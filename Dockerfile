FROM resin/rpi-raspbian

MAINTAINER Bruno Cardoso Cantisano <bruno.cantisano@gmail.com>

LABEL version latest
LABEL description Ionic container for Raspberry Pi

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENV APP_NAME myApp
ENV TEMPLATE blank

RUN apt-get clean \
    && apt-get -y update \
    && curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - \ 
    && apt-get install nodejs \
    && npm install -g ionic cordova \
    && mkdir /usr/local/ionic

WORKDIR /usr/local/ionic/

EXPOSE 8000

VOLUME /usr/local/ionic/

ENTRYPOINT ["/entrypoint.sh"]

CMD ["app:serve"]
