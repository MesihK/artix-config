#!/bin/sh

iw dev wlan0 info | grep ssid | cut -f2 -d ' '
