#!/bin/bash

address="$(ip address | awk 'NR==11{print $2}')"
connection="$( nmcli connection show | awk 'NR==2{print $1}')"
strength="$(cat /proc/net/wireless | awk 'NR==3{print $4}')"
icon="📡"
printf " %s %sdBm @ %s \\n" "$icon" "${strength%?}" "$connection"

