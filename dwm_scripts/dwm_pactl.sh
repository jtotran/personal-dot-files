#!/bin/bash 

volume=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( 0 + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
mute="$(pactl list sinks | grep '^[[:space:]]Mute:')"
mute_temp="$(echo -e '\tMute: yes')"
icon_mute="🔈"
icon_low="🔉"
icon_high="🔊"
if [ $volume -eq 0 ] || [ "$mute" == "$mute_temp" ];
then
	printf " %s %s \\n" "$icon_mute" "0%"
elif [ $volume -gt 0 ] && [ $volume -le 50 ];
then
	printf " %s %s \\n" "$icon_low" "$volume%"
else
	printf " %s %s \\n" "$icon_high" "$volume%"
fi
