#!/bin/bash
if [ -z "$1" ]; then
    echo "Specify repository to install pre-push hook"
    exit 0
fi

TARGET_REPO=$1
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SOUND="$DIR/push-it.wav"
PRE_PUSH=$TARGET_REPO/.git/hooks/pre-push

if which aplay >/dev/null; then
    cat > $PRE_PUSH <<EOL
#!/bin/sh
aplay $SOUND
EOL
    chmod +x $PRE_PUSH
    echo "Created pre-push hook in $TARGET_REPO"
    exit 1
else
    echo "Please install alsa-utils"
    exit 0
fi
