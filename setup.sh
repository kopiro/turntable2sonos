#!/bin/bash
sudo apt -y install darkice icecast2 darkice sox bc
pip install -U soco-cli

# Create the configuration file
sudo cp turntable2sonos.cfg /etc/turntable2sonos.cfg

# Create user and group (with home)
sudo useradd -m -s /bin/bash turntable2sonos

# Create support config file
sudo cp ./conf/darkice.cfg /etc/darkice.cfg
sudo cp ./conf/icecast.xml /etc/icecast2/icecast.xml
sudo cp ./conf/asoundrc /home/turntable2sonos/.asoundrc

# Copy the script
sudo cp turntable2sonos.sh /usr/local/bin/turntable2sonos

# Fix permissions
sudo chown -R turntable2sonos:turntable2sonos /home/turntable2sonos
sudo chown turntable2sonos /etc/turntable2sonos.cfg /usr/share/turntable2sonos/turntable2sonos.sh

# Copy the service
sudo cp turntable2sonos.service /etc/systemd/system/turntable2sonos.service

# Enable Icecast2 and Darkice
sudo systemctl daemon-reload
sudo systemctl enable icecast2
sudo systemctl enable darkice
sudo systemctl enable turntable2sonos