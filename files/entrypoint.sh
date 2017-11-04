#!/bin/bash
set -e

trap appStop SIGINT SIGTERM

APP_NAME=${APP_NAME:-myApp}
TEMPLATE=${TEMPLATE:-blank}
USER_NAME=${USER_NAME:-"John Doe"}
EMAIL=${EMAIL:-johndoe@example.com}

appStart () {
  set +e

  echo "git config..."
  git config --global user.name ${USER_NAME}
  git config --global user.email ${EMAIL}

  echo "Creating ionic app..."

  cd /nodejs_apps/ionic/

  ionic start ${APP_NAME} ${TEMPLATE}
}

appStop () {
  echo "Stopping ionic app..."
}

appServer () {
  set +e
  echo "Starting as server..."

  cd /nodejs_apps/ionic/${APP_NAME}

  ionic serve --lab -lcs -p 3000
  tail -f /dev/null
}

appHelp () {
  echo "Available options:"
  echo " app:start          - Creates an ionic app. ex.: ionic start myApp (blank, tabs, sidemenu or tutorial)"
  echo " app:server         - Starts the ionic as server (default)"
  echo " app:help           - Displays the help"
  echo " [command]          - Execute the specified linux command eg. bash."
}

case "$1" in
  app:start)
    appStart
    ;;
  app:server)
    appServer
    ;;
  app:help)
    appHelp
    ;;
  *)
    if [ -x $1 ]; then
      $1
    else
      prog=$(which $1)
      if [ -n "${prog}" ] ; then
        shift 1
        $prog $@
      else
        appHelp
      fi
    fi
    ;;
esac

exit 0
