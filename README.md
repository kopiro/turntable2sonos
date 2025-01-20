# Turntable2Sonos

Streams your turntable to Sonos device, plug&play.

Put your LP in the player, press play, and music is going to be streamed automatically to your Sonos device.

![Turntable2Sonos](turntable2sonos.jpg)

## Hardware prerequisites

- A Raspberry PI or equivalent (something small you can put closr to the Turntable); I recommend a version 3 minimum
- An microSD card to install Raspbian; you can go as small as 4GB
- A turntable with USB output or, if the turntable has RCA output (red + white), then a [RCA-to-USB Preamp](https://www.behringer.com/product.html?modelCode=0805-AAF)

I recommend to connect the Raspberry PI either via ethernet cable or buy a 5Ghz Wi-Fi adapter for better connection stability and no audio skips.

## Installation

You first need to install Raspbian on the SD card and being able to SSH into the Pi remotely (for convenience); I'd suggest [you start reading here](https://www.raspberrypi.com/documentation/computers/getting-started.html).

Once you're in, installation of the package is as simple as:

```
wget https://github.com/kopiro/turntable2sonos/raw/refs/heads/main/build/turntable2sonos-1.0.0.deb
sudo apt install -f ./turntable2sonos-*.deb
```

Modify the configuration file `/etc/turntable2sonos/turntable2sonos.cfg`, then start the service (and it will also start at boot) with `sudo systemctl enable --now turntable2sonos`

## Configurations

Additional configurations are:

- IceCast server: `/etc/turntable2sonos/icecast.xml`
- DarkIce: `/etc/turntable2sonos/darkice.cfg`
- ALSA: `/etc/alsa/conf.d/turntable2sonos.conf`

## Defaults

- The default port for the Icast server is `8000`
- Icast user credentials are `turntable:turntable`, while admin credentials are `root:toor`

## Maintanance

Restart the service:

```sh
sudo systemctl restart turntable2sonos
```

View the logs

```sh
journalctl -fu turntable2sonos
```