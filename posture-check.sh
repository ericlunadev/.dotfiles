#!/bin/bash

# Check if a message was passed as an argument
if [ -z "$1" ]; then
  echo "Usage: ./notify.sh 'Your message here'"
  exit 1
fi

message="${1:-Your custom message}"
terminal-notifier -message "$message" -title "Persistent Notification" -sound "Ping"
