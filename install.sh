#!/bin/bash

# Check if curl and jq are installed
if ! command -v curl &>/dev/null || ! command -v jq &>/dev/null; then
    echo "Please install curl and jq before running this script."
    exit 1
fi

# Hardcoded GitHub release URL
download_url="https://github.com/DomThePorcupine/ChatSH/releases/download/v0.0.0-alpha-0/chatsh"


# Create a temporary directory
tmp_dir=$(mktemp -d)

# Download and extract the binary
echo "Downloading $download_url ..."
curl -sL "$download_url" -o "$tmp_dir"/chatsh

# Move the binary to a directory in the user's path
echo "Moving binary to /usr/local/bin ..."
sudo mv "$tmp_dir"/* /usr/local/bin/ || { echo "Failed to move the binary to /usr/local/bin."; exit 1; }

# Make the binary executable
echo "Making the binary executable ..."
sudo chmod +x /usr/local/bin/chatsh

# Clean up
rm -rf "$tmp_dir"

echo "Installation complete."
