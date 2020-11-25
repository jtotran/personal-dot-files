#!/bin/bash

brightness_level=`xrandr --verbose | grep -m 1 -i brightness | cut -f2 -d ' '`
parsed_brightness=$(echo "${brightness_level:2}") 
icon_low="🔅"
icon_high="🔆"
if [ $parsed_brightness -le 50 ];
then
	printf " %s %s \\n" "$icon_low" "$parsed_brightness%"
else
	printf " %s %s \\n" "$icon_high" "$parsed_brightness%"
fi
