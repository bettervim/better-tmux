#!/bin/bash

# Set the GitHub repository and destination directory
repository="bettervim/better-tmux"
destination_directory="/usr/local/bin/"

# Determine the OS and architecture
os=$(uname -s | tr '[:upper:]' '[:lower:]')
arch=$(uname -m)

# Translate architecture to target-specific suffix
case "$arch" in
    x86_64) arch="x64" ;;
    aarch64) arch="arm64" ;;
    *) echo "Unsupported architecture: $arch" && exit 1 ;;
esac

# Set the executable name based on OS and architecture
executable_name="better-tmux-${os}-${arch}"
download_url="https://github.com/$repository/releases/latest/download/$executable_name"

# Download the executable from the latest release
wget -O "$executable_name" "$download_url"

# Check if the download was successful
if [ $? -ne 0 ]; then
    echo "Failed to download $download_url"
    exit 1
fi

# Check if the executable already exists and remove the old version if it does
if [ -f "$destination_directory/better-tmux" ]; then
  sudo rm "$destination_directory/better-tmux"
fi

# Rename the downloaded file to 'better-tmux'
mv "$executable_name" "better-tmux"

# Move the new executable to the destination directory
sudo mv "better-tmux" "$destination_directory"

# Set appropriate permissions (optional)
sudo chmod +x "$destination_directory/better-tmux"

echo "Successfully updated better-tmux CLI."
