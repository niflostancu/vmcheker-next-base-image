#!/bin/bash

fatal () {
    echo "$1" 1>&2
    exit 1
}

rm -f /usr/local/bin/bash
cp -rf /data/checker "$CI_PROJECT_DIR/"

echo "<VMCK_NEXT_BEGIN>"    # begin trace mark
(
    cd "$CI_PROJECT_DIR/checker" || fatal "The 'checker' directory was not found in your repository!"
    /bin/bash "./checker.sh"
)
echo "<VMCK_NEXT_END>"      # end trace mark

exec /bin/bash "$@"
