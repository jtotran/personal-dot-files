#!/bin/sh

battery=`cat /sys/class/power_supply/BAT0/capacity`
battery_status=`cat /sys/class/power_supply/BAT0/uevent | awk 'NR==3{print $1}'`
icon_high="⚡"
icon_medium="🔋"
icon_low="⚠️"
icon_charging="🔌"

if [ "$battery_status" == "POWER_SUPPLY_STATUS=Charging" ];
then
	printf " %s %s \\n" "$icon_charging" "$battery%"
elif [ "$battery_status" == "POWER_SUPPLY_STATUS=Discharging" ] && [ $battery -ge 85 ];
then
	printf " %s %s \\n" "$icon_high" "$battery%"
elif [ "$battery_status" == "POWER_SUPPLY_STATUS=Discharging" ] && [ $battery -le 15 ];
then
	printf " %s %s \\n" "$icon_low" "$battery%"
else
	printf " %s %s \\n" "$icon_medium" "$battery%"
fi
