docker run --rm -it \
           -p 9412:3000 \
           -e APP_NAME=teste-ionic \
           -e TEMPLATE=blank \
           -e USER_NAME="brunocantisano" \
           -e EMAIL=bruno.cantisano@gmail.com \
           -v /media/usbraid/docker/ionic/teste-ionic:/nodejs_apps/ionic/teste-ionic \
           paperinik/rpi-ionic
