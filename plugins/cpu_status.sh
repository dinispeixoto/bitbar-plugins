#!/bin/bash

# How to use it:
# 1. Commands that require admin permissions should be whitelisted with 'visudo', e.g.:
# dinispeixoto  ALL = NOPASSWD: /usr/bin/powermetrics
# 2. Update according to your fan speed max rpm. Mine is 7500 since I'm using a MacbookPro13.1 late 2016.
FAN_SPEED_MAX_RPM=7500 
# 3. If you also want CPU temperature: install https://github.com/lavoiesl/osx-cpu-temp and change the 
# variable below to 'true'. Unfortunately it's impossible to check OSX's cpu temp without third-party apps.
USE_CPU_TEMPERATURE=true
# 4. Customize it yourself. 


FAN_SPEED_RPM=$(sudo powermetrics -i 200 -n1 --samplers smc | grep "Fan: [0-9]*" | awk '{ print($2) }')
FAN_SPEED_PERCENTAGE=$( awk -v fsr="$FAN_SPEED_RPM" -v fsmr="$FAN_SPEED_MAX_RPM" \
                        'BEGIN { printf "%.0f %%\n", fsr/fsmr*100 }')
echo 🌀$FAN_SPEED_PERCENTAGE "| color=blue"
if [ "$USE_CPU_TEMPERATURE" = true ] ; then
    CPU_TEMPERATURE=$(/usr/local/bin/osx-cpu-temp)
    echo ♨️$CPU_TEMPERATURE "| color=red"
fi
