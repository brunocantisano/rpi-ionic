docker run --name ionic -it -e APP_NAME=teste -e TEMPLATE=blank \
           -v /media/usbraid/docker/ionic:/nodejs_apps/ionic \
           paperinik/rpi-ionic app:start
