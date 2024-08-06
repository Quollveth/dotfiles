#!/bin/bash

#source https://github.com/Pipshag/dotfiles_nord/tree/master

HWMON=hwmon1
CARD=card1

raw_clock=$(cat /sys/class/drm/${CARD}/device/pp_dpm_sclk | grep -o '[0-9]\+Mhz' | sed 's/Mhz//' | tail -n 1)
clock=$(echo "scale=1; $raw_clock / 1000" | bc | sed -e 's/^-\./-0./' -e 's/^\./0./')

raw_temp=$(cat /sys/class/drm/${CARD}/device/hwmon/${HWMON}/temp1_input)
temperature=$((raw_temp / 1000))

busypercent=$(cat /sys/class/hwmon/${HWMON}/device/gpu_busy_percent)

deviceinfo=$(glxinfo -B | grep 'Device:' | sed 's/^.*: //')
driverinfo=$(glxinfo -B | grep 'OpenGL version')

echo '{"text":"'$busypercent'%","tooltip":"'$temperature' °C\n'$clock' GHz"}'
# Why no json parsing for custom modules 😭
#echo '{"clock":"'"$clock"'","temperature":'"$temperature"',"busypercent":'"$busypercent"',"class":"custom-gpu","tooltip":"<b>'"$deviceinfo"'</b>\n'"$driverinfo"'"}'
