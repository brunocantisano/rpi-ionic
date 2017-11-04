docker run --rm -it \
           -e APP_NAME=teste-ionic \
           -e TEMPLATE=blank \
           -e USER_NAME="brunocantisano" \
           -e EMAIL=bruno.cantisano@gmail.com \
           -v /media/usbraid/docker/ionic:/nodejs_apps/ionic \
           paperinik/rpi-ionic app:start
