#!/bin/bash

# Define an array of targets
targets=("linux-x64" "linux-arm64" "darwin-x64" "darwin-arm64")

# Navigate to the packages/cli directory
cd packages/cli || {
    echo "Failed to navigate to packages/cli directory"
    exit 1
}

# Create the .build directory in the root if it doesn't exist
mkdir -p ../../.build

# Loop through each target and run the bun build command
for target in "${targets[@]}"; do
    # Build the project for the current target
    bun build src/Main.res.js --target=bun-$target --compile --outfile ./better-tmux-$target
    
    # Check if the command was successful
    if [ $? -ne 0 ]; then
        echo "Failed to build better-tmux for target $target"
        exit 1
    fi

    echo "Successfully built better-tmux for target $target"

    # Move the binary to the .build directory
    mv ./better-tmux-$target ../../.build/
    
    # Check if the move was successful
    if [ $? -ne 0 ]; then
        echo "Failed to move the binary for target $target to .build directory"
        exit 1
    fi
done

echo "All binaries have been successfully built and moved to the .build directory"

cd ../../
# Remove files with the pattern .<name>.bun-build in the current directory
find . -type f -name ".*.bun-build" -exec rm -f {} +
