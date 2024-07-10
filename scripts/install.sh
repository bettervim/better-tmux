#!/bin/bash

# Set the GitHub repository and destination directory
repository="bettervim/better-tmux"
destination_directory="/usr/local/bin/"
tmp_dir="/tmp/better-tmux-$(uuidgen)"

# Create a temporary directory
mkdir -p "$tmp_dir"
cd "$tmp_dir" || exit 1

# Determine the OS and architecture
os=$(uname -s | tr '[:upper:]' '[:lower:]')
arch=$(uname -m)

# -------
# This event is sent anonymously and contains no sensitive information. 
# It is used solely for analytics and insights purposes.
# -------
api_key="phc_tep6nTCW6RCBJsqkskTDUmF0bTpgFnRtgrRTdhV4gsn"
event_name="install"
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

# Set the executable name based on OS and architecture
if [ "$arch" = "x86_64" ]; then
    executable_name="better-tmux-linux-x64"
else
    executable_name="better-tmux-${os}-${arch}"
fi
download_url="https://github.com/$repository/releases/latest/download/$executable_name"

# Download the executable from the latest release
wget -O "$executable_name" "$download_url"

# Check if the download was successful
if [ $? -ne 0 ]; then
    echo "Failed to download $download_url"
    exit 1
fi

# Rename the downloaded file to 'better-tmux'
mv "$executable_name" "better-tmux"

# Move the executable to the destination directory
sudo mv "better-tmux" "$destination_directory"

# Set appropriate permissions (optional)
sudo chmod +x "$destination_directory/better-tmux"

# Clean up the temporary directory
rm -rf "$tmp_dir"

echo "Successfully installed better-tmux CLI."
