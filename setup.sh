#!/bin/bash

# Bail out if not running as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

apt -y install darkice icecast2 darkice sox bc python3-pip

# Create support config file
cp ./conf/darkice.cfg /etc/darkice.cfg
cp ./conf/icecast.xml /etc/icecast2/icecast.xml
cp ./conf/asound.conf /etc/asound.conf

pip3 install -U --break-system-packages soco-cli

# Create the configuration file
cp turntable2sonos.cfg /etc/turntable2sonos.cfg

# Copy the service
cp turntable2sonos.service /etc/systemd/system/turntable2sonos.service

# Enable Icecast2 and Darkice
systemctl daemon-reload
systemctl enable icecast2
systemctl enable darkice
systemctl enable turntable2sonos

echo "Setup complete. Please edit /etc/turntable2sonos.cfg to configure the application and REBOOT."