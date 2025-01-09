#!/bin/bash

if [ ! -f /etc/turntable2sonos.cfg ]; then
    echo "Configuration file not found. Please create a configuration file at /etc/turntable2sonos.cfg"
    exit 1
fi

source /etc/turntable2sonos.cfg || { echo "Failed to source configuration file"; exit 1; }

radio_url="http://$(hostname).local:8000/stream.mp3"

echo "Sonos Device Name: $sonos_device_name"
echo "ALSA Device: $alsa_device"
echo "Debounce Interval: $debounce_interval_sec"
echo "Check Interval: $check_interval_sec"
echo "Audio Threshold: $audio_threshold_db"
echo "Radio URL: $radio_url"

# Function to log messages to stdout
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') : $1"
}

log_message "Starting audio listener script on ALSA device ${alsa_device}"

# Initialize the last triggered time and silence start time
last_triggered_timestamp=0

while true; do
    # Capture a short audio sample from the specified ALSA device and get the RMS amplitude
    rms_amplitude=$(sox -t alsa "$alsa_device" -n stat trim 0 0.5 2>&1 | awk '/RMS/ { print $3 }' | head -n 1)

    # Check if RMS amplitude was successfully retrieved
    if [[ -z "$rms_amplitude" ]]; then
        log_message "Failed to retrieve RMS amplitude. Skipping this iteration."
        sleep "$check_interval_sec"
        continue
    fi

    # Check if RMS amplitude exceeds the threshold
    exceeds_threshold=$(echo "$rms_amplitude > $audio_threshold_db" | bc -l)

    if [[ "$exceeds_threshold" != "1" && "$exceeds_threshold" != "0" ]]; then
        log_message "Unexpected value for exceeds_threshold: '$exceeds_threshold'. Setting to 0."
        exceeds_threshold=0
    fi

    current_time=$(date +%s)

    if [ "$exceeds_threshold" = "1" ]; then
        if [ $((current_time - last_triggered_timestamp)) -ge "$debounce_interval_sec" ]; then
            log_message "Sound detected (RMS: $rms_amplitude), triggering Sonos to play radio"
            sonos "$sonos_device_name" play_uri "$radio_url"
            last_triggered_timestamp=$current_time
        else
            log_message "Sound detected but within debounce interval. Ignoring."
        fi
    fi

    sleep "$check_interval_sec"
done