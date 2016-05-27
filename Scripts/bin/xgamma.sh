#!/bin/bash 
xrandr | sed -n 's/ connected.*//p' | xargs -n1 -tri xrandr --output {} --brightness 0.85 --gamma 0.8:0.8:0.8