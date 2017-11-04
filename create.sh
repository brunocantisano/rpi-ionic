docker run --rm -it \
           -e APP_NAME=myApp \
           -e TEMPLATE=blank \
           -e USER_NAME="John Doe" \
           -e EMAIL=johndoe@example.com \
           -v /media/usbraid/docker/ionic:/nodejs_apps/ionic \
           paperinik/rpi-ionic app:start
