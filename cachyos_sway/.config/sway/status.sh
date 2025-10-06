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

    # WiFi name
    wifi="($(iw dev | awk '/Interface/ {iface=$2} /ssid/ {print $2; exit}'))"
    if [ -z "$wifi" ]; then
        wifi=""
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

    echo "RAM: $ram | CPU: $cpu | IP: $ip $wifi | BAT: $bat | $date_str"
    sleep 1
done
