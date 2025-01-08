#!/bin/bash

sudo apt -y install darkice icecast2 darkice sox bc python3-pip

# Create user and group (with home)
sudo useradd -m -s /bin/bash turntable2sonos

# Create support config file
sudo cp ./conf/darkice.cfg /etc/darkice.cfg
sudo cp ./conf/icecast.xml /etc/icecast2/icecast.xml
sudo cp ./conf/asoundrc /home/turntable2sonos/.asoundrc

# Install soco-cli as "turntable2sonos" user
sudo -u turntable2sonos pip3 install -U --break-system-packages soco-cli

# Create the configuration file
sudo cp turntable2sonos.cfg /home/turntable2sonos/.turntable2sonos.cfg

# Fix permissions
sudo chown -R turntable2sonos:turntable2sonos /home/turntable2sonos
sudo chmod +x turntable2sonos.sh

# Copy the service
sudo cp turntable2sonos.service /etc/systemd/system/turntable2sonos.service

# Enable Icecast2 and Darkice
sudo systemctl daemon-reload
sudo systemctl enable icecast2
sudo systemctl enable darkice
sudo systemctl enable turntable2sonos