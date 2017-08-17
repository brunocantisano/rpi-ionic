FROM hypriot/rpi-node

RUN npm install -g ionic cordova

MAINTAINER Bruno Cardoso Cantisano <bruno.cantisano@gmail.com>

LABEL Ionic container for Raspberry Pi

RUN npm install -g ionic cordova \
    && mkdir /usr/local/myApps

WORKDIR /usr/local/myApps

VOLUME /usr/local/myApps

ENTRYPOINT ionic

EXPOSE 80

CMD ["serve"]
