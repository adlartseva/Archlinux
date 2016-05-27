#!/bin/bash
# информация о железе
echo "Processor: "`cat /proc/cpuinfo | grep "model name" -m1 | cut -c14-`
echo "Memory (Gb): "`free | grep Mem | awk '{print int($2/10485.76)/100}'`
echo "Video: "`lspci -k | egrep 'VGA|3D' -A2`