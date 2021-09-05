#!/bin/bash

if [ -e /tmp/main.lock ] ; then
    rm -f /usr/local/bin/bash
    cp -rf /data/checker "$CI_PROJECT_DIR/"
    /bin/bash "$CI_PROJECT_DIR/checker/checker.sh"
    exec /bin/bash "$@"
else
    touch /tmp/main.lock
    exec /bin/bash "$@"
fi
