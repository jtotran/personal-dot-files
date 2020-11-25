#!/bin/bash

hdd="$(df -h | awk 'NR==4{print $3, $5}')"
icon="💾"
printf " %s DRIVE UTILIZATION: %s \\n" "$icon" "$hdd"

