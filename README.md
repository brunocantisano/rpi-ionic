# Ionic

![docker_logo](https://raw.githubusercontent.com/brunocantisano/rpi-ionic/master/files/docker.png)![docker_rocket-chat_logo](https://raw.githubusercontent.com/brunocantisano/rpi-ionic/master/files/logo-ionic.png)![docker_paperinik_logo](https://raw.githubusercontent.com/brunocantisano/rpi-ionic/master/files/docker_paperinik_120x120.png)

This Docker container implements a ionic framework for Raspberry Pi.

 * Raspbian base image: paperinik/rpi-node.
 
### Installation from [Docker registry hub](https://registry.hub.docker.com/u/paperinik/rpi-ionic/).

You can download the image with the following command:

```bash
docker pull paperinik/rpi-ionic
```

Definition
----

Build apps with web tech you know and love
Know how to build websites? Then you already know how to build mobile apps. Ionic Framework offers the best web and native app components for building highly interactive native and progressive web apps.

# How to use this image

The Ionic instance starts listening on the default port of 3000 on the container.

Exposed ports and volumes
----

The image exposes port `3000`. Also, exports one volume: `/nodejs_apps/ionic`, which contains ionic apps, used to store all the apps.

Environment variables
----

1) This image uses environment variables to allow the configuration of some parameteres at run time:

* Variable name: `APP_NAME`
* Default value: myApp
* Accepted values: app directory name.
* Description: you must inform a path to be created in order to run this container.
----

* Variable name: `TEMPLATE`
* Default value: blank
* Accepted values: blank, tabs, sidemenu or tutorial.
* Description: you must inform a template to be used when creating an app to be used on this container.
----

2) If you'd like to be able to create an app:
```bash
docker run --name ionic -d -p 9412:3000 \
           --env APP_NAME=teste \
           --env TEMPLATE=tutorial \
           -v /media/usbraid/docker/ionic:/nodejs_apps/ionic \
           paperinik/rpi-ionic start
```

3) If you'd like to be able to access the instance directly at standard port on the host machine:
```bash
docker run --name ionic -d -p 9412:3000 \
           -v /media/usbraid/docker/ionic:/nodejs_apps/ionic \
           paperinik/rpi-ionic
```
----

4) Then, access it via `http://localhost:9412` in a browser.