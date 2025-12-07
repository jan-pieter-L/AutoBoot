🛠️ AutoBoot

Automatically install and manage a systemd service that keeps another
Git repository up to date on every Raspberry Pi boot.

AutoBoot is designed to simplify Raspberry Pi deployments where a
project (e.g., FirstProgram) must always stay synchronized with a GitHub
repository. AutoBoot installs a systemd service that:

-   Clones the target Git repository (if it does not exist)
-   Pulls the latest changes on every boot
-   Logs update activity
-   Runs without user interaction

This makes it ideal for robots, IoT devices, appliances, and any
Pi-based system that must always run the latest code.

------------------------------------------------------------------------

📦 Repository Structure

    AutoBoot/
    │
    ├── update_repo.sh                 # Main update script (runs on every boot)
    ├── update_repo.service            # systemd service definition
    └── install_update_repo_service.sh # Installer script to set everything up

------------------------------------------------------------------------

🚀 How It Works

1.  You run the installer script once:

        ./install_update_repo_service.sh

2.  The installer:

    -   Installs the systemd service
    -   Copies update_repo.sh into /home/jacob/update_repo.sh
    -   Reloads systemd
    -   Starts the service for testing

3.  On every reboot, systemd runs:

        /home/jacob/update_repo.sh

    This script:

    -   Clones the target repo if missing

    -   Pulls updates if it already exists

    -   Appends logs to:

            /home/jacob/update_repo.log

------------------------------------------------------------------------

📥 Installation

1. Clone AutoBoot

    cd /home/jacob
    rm -rf AutoBoot
    git clone https://github.com/jan-pieter-L/AutoBoot.git

2. Run the installer

    cd AutoBoot
    chmod +x install_update_repo_service.sh
    ./install_update_repo_service.sh

The installer will:

-   Install update_repo.service
-   Copy the script to /home/jacob/update_repo.sh
-   Reload systemd
-   Restart the service
-   Display service status

------------------------------------------------------------------------

🔧 Systemd Service

Once installed, the service is located at:

    / etc/systemd/system/update_repo.service

You can manually control it:

    sudo systemctl start update_repo.service
    sudo systemctl stop update_repo.service
    sudo systemctl restart update_repo.service
    systemctl status update_repo.service

Enable/disable autostart:

    sudo systemctl enable update_repo.service
    sudo systemctl disable update_repo.service

------------------------------------------------------------------------

📑 Logs

The update script logs to:

    /home/jacob/update_repo.log

Contains:

-   Clone operations
-   Pull results
-   Error messages (if any)

------------------------------------------------------------------------

🔄 Changing the Repository to Update

Inside update_repo.sh, modify:

    REPO_URL="https://github.com/<username>/<repo>.git"
    DEST_DIR="/home/jacob/<folder-name>"

Restart the service after editing:

    sudo systemctl restart update_repo.service

------------------------------------------------------------------------

🧪 Testing

Force a fresh clone:

    rm -rf /home/jacob/FirstProgram
    sudo systemctl restart update_repo.service

Verify:

    ls -la /home/jacob/FirstProgram
    cat /home/jacob/update_repo.log

------------------------------------------------------------------------

🐞 Troubleshooting

❗ Permission denied writing to log

    sudo chown jacob:jacob /home/jacob/update_repo.log
    sudo chmod 664 /home/jacob/update_repo.log

❗ Repo does not clone on boot

    ping github.com
    journalctl -xeu update_repo.service
    cat /home/jacob/update_repo.log

❗ Service does not start at boot

    sudo systemctl enable update_repo.service

------------------------------------------------------------------------

🎯 Summary

AutoBoot provides:

-   A reliable update mechanism for Raspberry Pi projects
-   A clean systemd-managed workflow
-   Automatic boot-time synchronization with GitHub
-   Installation via a single script

Perfect for projects that must always run the latest version of your
code.
