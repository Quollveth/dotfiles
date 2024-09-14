#!/bin/bash
dir="$(realpath "$0" | xargs dirname | xargs dirname)"

rofi \
	-show drun \
	-theme ${dir}/launcher.rasi
