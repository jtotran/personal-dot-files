#!/bin/bash 

volume=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( 0 + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
pid_dwmblocks=$(pgrep dwmblocks) 
pid_i3blocks=$(pgrep i3blocks) 
if [ $volume -lt 100 ] && [ "$pid_dwmblocks" == "" ]; 
then
	pactl set-sink-volume 0 +5%
	pkill -RTMIN+1 i3blocks
elif [ $volume -lt 100 ] && [ "$pid_i3blocks" == "" ]; 
then
	pactl set-sink-volume 0 +5%
	pkill -RTMIN+1 dwmblocks
fi
