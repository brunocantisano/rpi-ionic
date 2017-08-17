FROM hypriot/rpi-node

MAINTAINER Bruno Cardoso Cantisano <bruno.cantisano@gmail.com>

LABEL Ionic container for Raspberry Pi

RUN npm install -g ionic cordova \
    && mkdir /usr/local/myApps

RUN rm -rf /usr/local/lib/node_modules \ 
    && rm -rf ~/.npm \
    && curl -0 -L https://npmjs.org/install.sh | sudo sh \
    && npm install -g ionic cordova

WORKDIR /usr/local/myApps

VOLUME /usr/local/myApps

ENTRYPOINT ionic

EXPOSE 80

CMD ["serve"]
