#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Close All
# @raycast.mode compact

# Optional parameters:
# @raycast.icon ❌
# @raycast.packageName Developer Utils

# Documentation:
# @raycast.description Close All Apps
# @raycast.author Eric

# Closes all open applications except those in the exclusion list,
#              then turns Bluetooth off.

# Run AppleScript to quit apps, excluding certain apps
osascript <<EOF
-- get list of open apps
tell application "System Events"
    set allApps to displayed name of (every process whose background only is false) as list
end tell

-- leave some apps open
set exclusions to {"AppleScript Editor", "Automator", "LaunchBar", "Google Chrome", "Arc"}

-- quit each app
repeat with thisApp in allApps
    set thisApp to thisApp as text
    if thisApp is not in exclusions then
        tell application thisApp to quit
    end if
end repeat
EOF

# Turn off Bluetooth
/opt/homebrew/bin/blueutil --power 0

