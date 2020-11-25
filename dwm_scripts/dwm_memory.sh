#!/bin/bash 

mem="$(free -m | awk 'NR==2{printf "%s/%sMiB\n", $3,$2,$3*100/$2 }')"
icon="🧠"
printf " %s MEMORY UTILIZATION: %s \\n" "$icon" "$mem"
