FROM paperinik/rpi-node

MAINTAINER Bruno Cardoso Cantisano <bruno.cantisano@gmail.com>

LABEL version latest
LABEL description Ionic container for Raspberry Pi

COPY files/entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENV APP_NAME myApp
ENV TEMPLATE blank

RUN apt-get clean \
    && apt-get -y update \
    && npm install -g ionic cordova \
    && mkdir /nodejs_apps/ionic

WORKDIR /nodejs_apps/ionic/

EXPOSE 3000

VOLUME /nodejs_apps/ionic/

ENTRYPOINT ["/entrypoint.sh"]

CMD ["app:serve"]
