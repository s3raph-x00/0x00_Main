#!/bin/bash
# Startup Script for Captures

function bluetoothstart()
{
 ps auxw | grep -P '\b'$1'(?!-)\b' > /dev/null
 if [ $1 != 0 ]
 then
  echo "service $1 wasn't started, staring now"
  service $1 start;
 else
  echo "service $1 was already started, skipping.";
fi;
}

function gpsdstart()
{
 pkill gpsd
 ps auxw | grep -P '\b'$1'(?!-)\b' > /dev/null
 if [ $1 != 1 ]
 then
  echo "service $1 started, stopping so it won't cause any issues"
  service $1 stop
  gpsd -n /dev/ttyS1;
 else
  echo "service $1 was not started, starting gpsd."
  gpsd -n /dev/ttyS1;
fi;
}

function airmonstart
{
airmon-ng check kill
for IFACE in $(ifconfig | grep wlan* | cut -d ' ' -f1 | tr ':' '\n' | awk NF)
 do
  echo "starting $IFACE in monitor mode" 
  airmon-ng start $IFACE
 done
}

bluetoothstart "bluetooth"
gpsdstart gpsd
airmonstart
