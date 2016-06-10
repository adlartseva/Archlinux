#!/bin/bash
echo "<img>/home/kosha/.bin/icons/system-monitor-symbolic.svg</img>"

echo "<click>gnome-system-monitor</click>"

echo "<txt>  Цп: "$(awk 'BEGIN{i=0} {sum[i]=$2+$3+$4+$5; idle[i++]=$5} END {printf "%d\n", 100*( (sum[1]-sum[0]) - (idle[1]-idle[0]) ) / (sum[1]-sum[0])} ' <( head -n 1 /proc/stat; sleep 0.5; head -n 1 /proc/stat))%"  \
Пам: "$(awk '/MemTotal:/{total=$2} /MemFree:/{free=$2} /Buffers:/{buffers=$2} /^Ca/{cached=$2} END { print ((total-(free+cached+buffers))*100/total)}' /proc/meminfo | cut -d '.' -f1)%"   \
Темп: "$(sensors | grep "Core" | cut -d " " -f9 | cut -c2-8 | tr -s '\r\n' ' ' | cut --complement -c3,4,11,12; sensors | grep 'temp1' | tr -s '\r\n' ' ' | cut --complement -c -8,11,12,16-41,43,46,47,51-)"</txt>"
echo "<tool>Системный монитор</tool>"
