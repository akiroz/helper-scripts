#!/bin/bash

if [ $# -eq 4 ]; then
    palette="/tmp/palette.png"
    filters="fps=15,scale=320:-1:flags=lanczos"
    ffmpeg -v warning -ss $2 -t $3 -i $1 -vf "$filters,palettegen" -y $palette
    ffmpeg -v warning -ss $2 -t $3 -i $1 -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y $4
else
    echo "usage: gifenc <video> <seek> <duration> <gif>"
    echo "seek|duration := [[Hours:]MM:]SS[.MilliSec]"
fi
