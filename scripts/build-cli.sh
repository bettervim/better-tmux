#!/bin/bash

# Define an array of targets
targets=("linux-x64" "linux-arm64" "darwin-x64" "darwin-arm64")

# Navigate to the packages/cli directory
cd packages/cli || {
    echo "Failed to navigate to packages/cli directory"
    exit 1
}

# Loop through each target and run the bun build command
for target in "${targets[@]}"; do
    # Build the project for the current target
    bun build src/Main.res.js --target=bun-$target --compile --outfile ./better-tmux-$target
    
    # Check if the command was successful
    if [ $? -ne 0 ]; then
        echo "Failed to build better-tmux for target $target"
        exit 1
    fi

    # Check if the rename was successful
    if [ $? -ne 0 ]; then
        echo "Failed to rename the output file for target $target"
        exit 1
    fi

    echo "Successfully built better-tmux for target $target"
done

