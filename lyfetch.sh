#!/bin/bash

computer_name=$HOSTNAME
echo "| HostName: $computer_name"

System="$(cat /etc/os-release | grep -oP "(PRETTY_NAME=)\K.*")"
echo "| OS: $System"
Kernel="$(uname -r)"
echo "| Kernel: $Kernel"

total_memory="$(free --giga -h | awk 'FNR == 2 {print $2}')"
used_memory="$(free --giga -h | awk 'FNR == 2 {print $3}')"
available_memory="$(free --giga -h | awk 'FNR == 2 {print $4}')"

echo "| Memory: $total_memory"
echo "| Used memory: $used_memory"
echo "| Available memory: $available_memory"

processor_name="$(grep 'model name' /proc/cpuinfo | head -n 1 | cut -d ':' -f 2 | tr -s ' ')"
processor_cores="$(nproc --all)"

echo "| Processor name: $processor_name"
echo "| Available cores: $processor_cores"