#!/bin/bash

# Set the GitHub repository, executable name, and download URL
repository="bettervim/better-tmux"
executable_name="better-tmux"
download_url="https://github.com/$repository/releases/latest/download/$executable_name"

# Set the destination directory in the PATH
destination_directory="/usr/local/bin/"

# Download the executable from the latest release
wget -O "$executable_name" "$download_url"

# Check if the executable already exists and remove the old version if it does
if [ -f "$destination_directory/$executable_name" ]; then
  sudo rm "$destination_directory/$executable_name"
fi

# Move the new executable to the destination directory
sudo mv "$executable_name" "$destination_directory"

# Set appropriate permissions (optional)
sudo chmod +x "$destination_directory/$executable_name"

echo "Successfully updated better-tmux cli."
