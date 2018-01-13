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
elif which afplay >/dev/null; then
    PLAYER=afplay
else
    echo "Could not find alsa-utils (Linux) or afplay (OSX)"
    exit 0
fi

if [ ! -d "$TARGET_REPO/.git/hooks" ]; then
  mkdir $TARGET_REPO/.git/hooks
  echo "Created hooks folder in $TARGET_REPO/.git/hooks"
fi

cat > $PRE_PUSH <<EOL
#!/bin/bash
SOUND[0]="$DIR/push-it.wav"
SOUND[1]="$DIR/selfie.wav"
SOUND[2]="$DIR/that-was-easy.wav"
SOUND[3]="$DIR/salt-n-pepa.wav"
RANDOM_SOUND=\$[\$[\$RANDOM % 4]]
$PLAYER \${SOUND[\$RANDOM_SOUND]}
EOL
chmod +x $PRE_PUSH
echo "Created pre-push hook in $TARGET_REPO"
exit 1
