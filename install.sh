#!/bin/bash
if [ -z "$1" ]; then
    echo "Specify repository to install pre-push hook"
    exit 0
fi

TARGET_REPO=$1
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PRE_PUSH=$TARGET_REPO/.git/hooks/pre-push

if which aplay >/dev/null; then
    PLAYER=aplay
elif which aflay >/dev/null; then
    PLAYER=afplay
else
    echo "Could not find alsa-utils (Linux) or afplay (OSX)"
    exit 0
fi

cat > $PRE_PUSH <<EOL
#!/bin/bash
SOUND[0]="$DIR/push-it.wav"
SOUND[1]="$DIR/selfie.wav"
SOUND[2]="$DIR/that-was-easy.wav"
RANDOM_SOUND=\$[\$[ RANDOM % 3]]
aplay \${SOUND[\$RANDOM_SOUND]}
EOL
chmod +x $PRE_PUSH
echo "Created pre-push hook in $TARGET_REPO"
exit 1
