#!/bin/bash
set -e

# Install the update script
cp /boot/update_repo_on_boot.sh /home/jacob/update_repo_on_boot.sh
chmod +x /home/jacob/update_repo_on_boot.sh
chown jacob:jacob /home/jacob/update_repo_on_boot.sh

# Install the systemd service
cp /boot/update-repo.service /etc/systemd/system/update-repo.service
systemctl enable update-repo.service
