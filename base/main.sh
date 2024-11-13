#!/bin/bash

fatal () {
    echo "$1" 1>&2
    exit 1
}

rm -f /usr/local/bin/bash
cp -rf /data/checker "$CI_PROJECT_DIR/"

useradd -M -U mrchecker
chown -R mrchecker:mrchecker "$CI_PROJECT_DIR"

# We do not need the git repo anymore
rm -rf "$CI_PROJECT_DIR/.git"

echo "<VMCK_NEXT_BEGIN>"    # begin trace mark
(
    cd "$CI_PROJECT_DIR/checker" || fatal "The 'checker' directory was not found in your repository!"
    unset "${!CI@}"
    su -c '/bin/bash "./checker.sh"' mrchecker
)
echo "<VMCK_NEXT_END>"      # end trace mark

exec /bin/bash "$@"
