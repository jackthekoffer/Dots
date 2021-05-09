#!/bin/bash
# Checks if ffmpeg is running if not it runs/records if so it kills it.
SERVICE="ffmpeg"
if pgrep -x "$SERVICE" >/dev/null
then
    sleep 3 # Helps prevent sound cut off.
    pkill "$SERVICE"
else
    while [[ -f $HOME/raw$n.mkv  ]]
    do n=$((n+1))
    done
    filename="$HOME/raw$n.mkv"

    ffmpeg -y \
        -f x11grab \
        -s $(xdpyinfo |grep dimensions | awk '{print $2;}') \
        -i :0.0 \
        -f alsa -i default \
        -c:v libx264rgb -crf 0 -preset ultrafast $filename
        #-c:v libx264 -r 30 -c:a flac $filename
fi

# Later add dates for video files, and add streamin on different key press.
