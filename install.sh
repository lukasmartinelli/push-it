#!/bin/bash
if [ -z "$1" ]; then
    echo "Specify repository to install pre-push hook"
    exit 0
fi


SELECTED_SOUND=$2
RANDOM_STRING="RANDOM"

TARGET_REPO=$1

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SOUNDS_DIR="$DIR/sounds"
PRE_PUSH=$TARGET_REPO/.git/hooks/pre-push

NO_SOUND="nothing"
SOUND_TO_PLAY=$NO_SOUND

if [ -z "$2" ]; then
    SELECTED_SOUND=$RANDOM_STRING
    echo "Random sound is set. If you prefer one more, you can set it with name of sound file."
    echo "Names of available files:"
    for file in $SOUNDS_DIR/*; do
        FULL_FILE_NAME=${file##*/}
        FILE_NAME=${FULL_FILE_NAME%.*}
        echo $FILE_NAME
    done
fi


if which aplay >/dev/null; then
    PLAYER=aplay
elif which afplay >/dev/null; then
    PLAYER=afplay
else
    echo "Could not find alsa-utils (Linux) or afplay (OSX)"
    exit 0
fi

# Set random sound file to SOUND_TO_PLAY
if [ $SELECTED_SOUND == $RANDOM_STRING ]
	then
  files=($(ls "${SOUNDS_DIR}"))
  num_files=${#files[*]}
  SOUND_TO_PLAY="${SOUNDS_DIR}/${files[$((RANDOM%num_files))]}"
  echo "Selected file: ${SOUND_TO_PLAY}"
fi

# Set selected song to SOUND_TO_PLAY
if [ $SELECTED_SOUND != $RANDOM_STRING ]
then
for file in $SOUNDS_DIR/*; do
    FULL_FILE_NAME=${file##*/}
    FILE_NAME=${FULL_FILE_NAME%.*}
    if [ $SELECTED_SOUND == $FILE_NAME ]
	then
        SOUND_TO_PLAY=$file
		break
	fi
done
fi

# Inform user about non exist sound
if [ $SOUND_TO_PLAY == $NO_SOUND ]
	then
    echo "Something's wrong. Probably you set wrong name of file or file don't exist"
    exit 0
fi

if [ ! -d "$TARGET_REPO/.git/hooks" ]; then
  mkdir $TARGET_REPO/.git/hooks
  echo "Created hooks folder in $TARGET_REPO/.git/hooks"
fi

cat > $PRE_PUSH <<EOL
#!/bin/bash
$PLAYER $SOUND_TO_PLAY
EOL
chmod +x $PRE_PUSH
echo "Created pre-push hook in $TARGET_REPO"
exit 1
