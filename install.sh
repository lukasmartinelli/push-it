#!/bin/bash
if [ -z "$1" ]; then
    echo "Specify repository to install pre-push hook"
fi

TARGET_REPO=$1
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SOUND="$DIR/push-it.wav"

if which aplay >/dev/null; then
    cat > $TARGET_REPO/.git/hooks/pre-push <<-EOL
        #!/bin/sh
        aplay $SOUND
EOL
    echo "Created pre-push hook in $TARGET_REPO"
    exit 1
else
    echo "Please install alsa-utils"
    exit 0
fi
