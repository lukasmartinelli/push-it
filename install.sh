#!/bin/sh

TARGET_REPO=$1

if which vlc >/dev/null; then
    cp -f pre-push $TARGET_REPO/.git/hooks
    echo "Copied pre-push into git hooks"
    exit 1
else
    echo "Please install vlc"
    exit 0
fi

