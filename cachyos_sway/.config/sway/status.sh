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

    # Date
    date_str=$(date +'%Y-%m-%d %X')

    echo "RAM: $ram | CPU: $cpu | IP: $ip $network_name | BAT: $bat | $date_str"
    sleep 1
done
