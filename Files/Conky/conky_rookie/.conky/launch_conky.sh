#!/bin/sh

sh -c "sleep 1 && nvidia-settings -a [gpu:0]/GPUFanControlState=1 &"

sh -c "sleep 3 && nvidia-settings -a [fan:0]/GPUTargetFanSpeed=20 &"

sh -c "sleep 7 && conky -c $HOME/.conky/conkyrc 2>&1 > /dev/null &"

sh -c "sleep 10 && conky -c $HOME/.Conky/htc_home/conkyrc &"

exit 0
