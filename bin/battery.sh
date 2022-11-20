#!/usr/bin/env bash

BAT_PATH=/sys/class/power_supply/macsmc-battery

BAT_CAPACITY="$(cat $BAT_PATH/capacity)"
BAT_STATUS="$(cat $BAT_PATH/status)"

echo "$BAT_CAPACITY $BAT_STATUS"
