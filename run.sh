docker run --rm -it \
           -p 9412:3000 \
           -e APP_NAME=myApp \
           -e TEMPLATE=blank \
           -e USER_NAME="John Doe" \
           -e EMAIL=johndoe@example.com \
           -v /media/usbraid/docker/ionic/myApp:/nodejs_apps/ionic/myApp \
           paperinik/rpi-ionic
