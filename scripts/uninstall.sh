#!/bin/bash

# Set the executable name and destination directory
executable_name="better-tmux"
destination_directory="/usr/local/bin"

# Remove the executable
sudo rm "$destination_directory/$executable_name"

echo "Uninstallation completed."
