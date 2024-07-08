#!/bin/bash

# Set the executable name and destination directory
executable_name="better-tmux"
destination_directory="/usr/local/bin"

# -------
# This event is sent anonymously and contains no sensitive information. 
# It is used solely for analytics and insights purposes.
# -------
api_key="phc_tep6nTCW6RCBJsqkskTDUmF0bTpgFnRtgrRTdhV4gsn"
event_name="uninstall"
id=$(uuidgen)
curl -X POST https://us.i.posthog.com/capture/ \
    -H "Content-Type: application/json" \
    -d '{
        "api_key": "'$api_key'",
        "event": "'$event_name'",
        "properties": {
            "distinct_id": "'$id'",
            "arch": "'$arch'",
            "os": "'$os'"
        }
    }'

clear

# Remove the executable
sudo rm "$destination_directory/$executable_name"

echo "Uninstallation completed."
