###############################
##Raspberry Pi Auto-Update Setup
###############################

This setup makes the Raspberry Pi automatically pull the latest version of a public GitHub repo on every boot, without running any commands on the Pi.

##Files Needed
####################

Place these four files into the /boot partition after flashing the SD card:

/boot/update_repo_on_boot.sh
/boot/update-repo.service
/boot/install_update_repo_service.sh
/boot/rc.local

##What Each File Does
#####################

update_repo_on_boot.sh — clones/pulls the GitHub repo and logs updates

update-repo.service — systemd service that runs the update script every boot

install_update_repo_service.sh — installs and enables the service on first boot

rc.local — triggers the installer script once on the first boot

##How It Works
##############

At first boot, rc.local runs the installer script.

The installer copies the update script into /home/jacob/, enables the systemd service, and finishes.

On every boot afterward, the service pulls the latest code from GitHub automatically.

##Usage
#######

After copying the files into /boot, eject the SD card, insert it into the Raspberry Pi, and power it on. The update process happens automatically at each boot.

Done.