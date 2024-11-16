#!/bin/bash

# Get today's date in YYYY-MM-DD format
TODAY=$(date '+%Y-%m-%d')

# Search the APT history log for packages installed today
echo "Packages installed on $TODAY:"

cat /var/log/apt/history.log | grep "Start-Date: $TODAY" -A 5 | grep "Commandline" | awk -F"install " '{print $2}'
