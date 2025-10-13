#!/bin/bash

while true; do
    # RAM usage
    ram=$(free -h | awk '/^Mem:/ {print $3 "/" $2}')

    # CPU usage
    cpu=$(top -bn1 | grep "Cpu(s)" | awk '{printf "%.1f%%", $2}' | sed 's/%us,//')

    # IP address
    ip=$(ip route get 1 2>/dev/null | awk '{print $7; exit}')
    if [ -z "$ip" ]; then
        ip="disconnected"
    fi

    # Network connection
    iface="$(iw dev | awk '$1=="Interface"{print $2; exit}')"
    ssid="$(iw dev "$iface" link | awk -F'SSID: ' '/SSID: /{print $2; exit}')"

    # Determine network type and name
    network_name=""
    if [ -n "$ssid" ]; then
        # WiFi connection - use actual SSID name
        network_name="($ssid)"
    else
        # Check for ethernet connection
        eth_iface=$(ip route get 1 2>/dev/null | awk '{print $5; exit}')
        if [[ "$eth_iface" =~ ^(eth|enp|eno) ]]; then
            network_name="(Ethernet)"
        else
            network_name="(Unknown)"
        fi
    fi

    # Battery
    bat=$(cat /sys/class/power_supply/BAT*/capacity 2>/dev/null | head -1)
    if [ -n "$bat" ]; then
        bat="${bat}%"
    else
        bat="N/A"
    fi

    # Audio output device with volume
    default_sink=$(pactl info | grep "Default Sink:" | awk '{print $3}')
    if [ -n "$default_sink" ]; then
        # Get the user-friendly description of the sink
        audio_device=$(pactl list sinks | grep -A 20 "Name: $default_sink" | grep "Description:" | sed 's/.*Description: //' | head -1)
        # Shorten common long names for better display
        audio_device=$(echo "$audio_device" | sed 's/Digital Stereo (IEC958)/Digital/' | sed 's/Analog Stereo/Analog/')

        # Get volume percentage (average of left and right channels)
        volume=$(pactl list sinks | grep -A 20 "Name: $default_sink" | grep "Volume:" | head -1 | awk '{print $5}' | sed 's/%//')

        # Check if muted
        muted=$(pactl list sinks | grep -A 20 "Name: $default_sink" | grep "Mute:" | awk '{print $2}')

        # Limit device name length to make room for volume
        if [ ${#audio_device} -gt 20 ]; then
            audio_device="${audio_device:0:17}..."
        fi

        # Format: device (volume%) or device (muted)
        if [ "$muted" = "yes" ]; then
            audio_device="$audio_device (muted)"
        else
            audio_device="$audio_device (${volume}%)"
        fi
    else
        audio_device="No Audio"
    fi

    # Date
    date_str=$(date +'%Y-%m-%d %X')

    echo "RAM: $ram | CPU: $cpu | IP: $ip $network_name | BAT: $bat | Audio: $audio_device | $date_str"
    sleep 1
done
