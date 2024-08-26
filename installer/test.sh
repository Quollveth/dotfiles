#!/bin/bash

replace='swaylock'

sed -i "41s/.*/actions[lockscreen]=\"$replace\"/" /usr/local/bin/rofi-power-menu
