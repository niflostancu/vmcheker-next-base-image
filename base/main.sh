#!/bin/bash

rm -f /usr/local/bin/bash
cp -rf /data/checker "$CI_PROJECT_DIR/"
(
    cd "$CI_PROJECT_DIR/checker" || exit 1
    /bin/bash "./checker.sh"
)
exec /bin/bash "$@"
