#!/bin/bash
EXTERNAL_OUTPUT="hdmi-stereo"
INTERNAL_OUTPUT="analog-stereo"

# if we don't have a file, start at zero
if [ ! -f "/tmp/audio_mode.dat" ] ; then
    audio_mode="INTERNAL"

# otherwise read the value from the file
else
    audio_mode=`cat /tmp/audio_mode.dat`
fi

if [ $audio_mode = "INTERNAL" ]; then
    audio_mode="EXTERNAL"
	pacmd set-default-sink 0
elif [ $audio_mode = "EXTERNAL" ]; then
    audio_mode="BLUETOOTH"
	pacmd set-default-sink 2
else
	pacmd set-default-sink 1
    audio_mode="INTERNAL"
fi

echo "${audio_mode}" > /tmp/audio_mode.dat
pkill -RTMIN+12 i3blocks
