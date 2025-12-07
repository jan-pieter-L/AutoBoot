#!/bin/bash
set -e
export PATH=/usr/bin:/bin:/usr/local/bin

echo "=== Updating repo on boot ===" >> /home/jacob/update_repo.log

REPO_URL="https://github.com/jan-pieter-L/FirstProgram.git"
DEST_DIR="/home/jacob/FirstProgram"

# Ensure repo exists; clone if not
if [ ! -d "$DEST_DIR/.git" ]; then
    git clone "$REPO_URL" "$DEST_DIR"
fi

# Pull latest changes
cd "$DEST_DIR"
git pull

echo "=== Done updating ===" >> /home/jacob/update_repo.log
