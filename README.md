# Turntable2Sonos

Streams your turntable to Sonos device, plug&play.

Put your LP in the player, press play, and music is going to be streamed automatically to your Sonos device.

## Hardware prerequisites

- A Raspberry PI or equivalent; I recommend a version 3 minimum
- An microSD card to install Linux
- A turntable with USB output or an [RCA-to-USB Preamp](https://www.behringer.com/product.html?modelCode=0805-AAF)

## Installation

```
cd /usr/share
git clone https://github.com/kopiro/turntable2sonos
cd turntable2sonos
sudo ./setup.sh
```

### Upgrade

```
cd /usr/share/turntable
git fetch origin
git reset --hard origin/main
sudo ./setup.sh
```