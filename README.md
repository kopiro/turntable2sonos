# Turntable2Sonos

Streams your turntable to Sonos device, plug&play.

Put your LP in the player, press play, and music is going to be streamed automatically to your Sonos device.

![Turntable2Sonos](turntable2sonos.jpg)

## Hardware prerequisites

- A Raspberry PI or equivalent; I recommend a version 3 minimum
- An microSD card to install Linux
- A turntable with USB output or an [RCA-to-USB Preamp](https://www.behringer.com/product.html?modelCode=0805-AAF)

## Installation

```
apt -y install git
cd /usr/share
git clone https://github.com/kopiro/turntable2sonos.git
cd turntable2sonos
source setup.sh
```

## Configuration

The configuration file is in `/etc/turntable2sonos.cfg` and it should be pretty explanatory.

### Upgrade

```
cd /usr/share/turntable
git fetch origin
git reset --hard origin/main
source setup.sh
```