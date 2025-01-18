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
wget https://github.com/kopiro/turntable2sonos/raw/refs/heads/main/build/turntable2sonos-1.0.0.deb
dpkg -i turntable2sonos-1.0.0.deb
```

## Configuration

The configuration files live `/etc/turntable2sonos`; the only file you should change is `/etc/turntable2sonos/turntable2sonos.cfg`.

Additional configurations are:

- IceCast server: `/etc/turntable2sonos/icecast.xml`
- DarkIce: `/etc/turntable2sonos/darkice.cfg`
- ALSA: `/etc/alsa/conf.d/turntable2sonos.conf`

## Defaults

- The default port for the Icast server is `8000`
- Icast user credentials are `turntable:turntable`, while admin credentials are `root:toor`
