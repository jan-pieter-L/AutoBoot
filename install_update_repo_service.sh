cd /home/jacob # make sure we are in home directory
rm -rf AutoBoot # remove old repo if it exists
git clone https://github.com/jan-pieter-L/AutoBoot.git # Get all scripts from repo.

sudo mv /home/jacob/AutoBoot/update_repo.service /etc/systemd/system/update_repo.service #move service file to systemd folder
sudo chmod 644 /etc/systemd/system/update_repo.service # set permissions
sudo chown jacob:jacob /home/jacob/update_repo.log # set log file ownership
sudo systemctl daemon-reload # reload systemd to recognize new service


cd /home/jacob/AutoBoot
cp /home/jacob/AutoBoot/update_repo.sh /home/jacob/update_repo.sh # copy the update script to home directory
chmod +x /home/jacob/update_repo.sh # make script executable

rm -rf AutoBoot # remove the cloned repo

sudo systemctl restart update_repo.service # restart the service to test it
systemctl status update_repo.service # check status