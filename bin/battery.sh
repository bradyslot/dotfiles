#!/usr/bin/env bash

BAT_PATH=/sys/class/power_supply/macsmc-battery/capacity

awk '{print $1"%"}' $BAT_PATH
