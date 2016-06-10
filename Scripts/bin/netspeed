#!/bin/bash
echo "<img>/home/kosha/.bin/icons/network-wireless-elementary.svg</img>"
#settings:
echo "<txt> "$(netspeed=true
#---------------- initialize ---------------------------
rm /tmp/.sysmon > /dev/null 2>&1
dstat --net --output=/tmp/.sysmon 1 1 > /dev/null 2>&1
#----------- up/down speed -----------------------------
if [ $netspeed = true ]; then

upspeed=$(echo $(cat /tmp/.sysmon | tail -1 | cut -d ',' -f2)/1024 | bc)

upkbmb=$(if [ $upspeed -gt 1024 ]; then 
		up1=$(echo $(cat /tmp/.sysmon | tail -1 | cut -d ',' -f2)/1024/1024 | bc -l)
		echo $up1 | head -c 4
	else 
		echo $upspeed | head -c 3
	fi)

downspeed=$(echo $(cat /tmp/.sysmon | tail -1 | cut -d ',' -f1)/1024 | bc)

downkbmb=$(if [ $downspeed -gt 1024 ]; then 
		down1=$(echo $(cat /tmp/.sysmon | tail -1 | cut -d ',' -f1)/1024/1024 | bc -l)
		echo $down1 | head -c 4
	else 
		echo $downspeed | head -c 3
	fi)
#---------------- up/down speed unit --------------------
upunit=$(if [ $upspeed -gt 1024 ]; then echo "Мб/с"; else echo "Кб/с"; fi)
downunit=$(if [ $downspeed -gt 1024 ]; then echo "Мб/с"; else echo "Кб/с"; fi)

fi

#------------------ The Indicator Sysmonitor actual output -
echo ↓ $downkbmb $downunit ↑ $upkbmb $upunit)"</txt>"
echo "<click>nm-connection-editor</click>"
echo "<tool>Сетевой монитор</tool>"
