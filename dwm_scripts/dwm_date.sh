#!/bin/bash

dte="$(date +"%a, %B %d %l:%M%p" | sed 's/  / /g')"
icon="📆"
printf " %s %s \\n" "$icon" "$dte"

