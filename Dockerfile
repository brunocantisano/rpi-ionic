FROM paperinik/rpi-node

MAINTAINER Bruno Cardoso Cantisano <bruno.cantisano@gmail.com>

LABEL version latest
LABEL description Ionic container for Raspberry Pi

COPY files/entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENV APP_NAME myApp
ENV TEMPLATE blank
ENV USER_NAME "John Doe"
ENV EMAIL johndoe@example.com

RUN apt-get clean \
    && apt-get update \
    && apt-get install -y openssh-server openssh-client git build-essential \
    && mkdir -p /nodejs_apps/ionic/ \
    && npm install -g ionic cordova 

WORKDIR /nodejs_apps/ionic/

EXPOSE 3000

VOLUME /nodejs_apps/ionic/

ENTRYPOINT ["/entrypoint.sh"]

CMD ["app:server"]
