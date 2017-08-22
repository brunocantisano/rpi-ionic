#!/bin/bash
set -e

trap appStop SIGINT SIGTERM

appStart () {
  set +e
  echo "Creating ionic app..."
  ionic start ${APP_NAME} ${TEMPLATE}
  tail -f /dev/null
}

appStop () {
  echo "Stopping ionic app..."
}

appServe () {
  set +e
  echo "Starting as server..."
  ionic serve --lab -lcs -p 8000
  tail -f /dev/null
}

appHelp () {
  echo "Available options:"
  echo " app:start          - Creates an ionic app. ex.: ionic start myApp (blank, tabs, sidemenu or tutorial)"
  echo " app:serve          - Starts the ionic as server (default)"
  echo " app:help           - Displays the help"
  echo " [command]          - Execute the specified linux command eg. bash."
}

case "$1" in
  app:start)
    appStart
    ;;
  app:serve)
    appServe
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
