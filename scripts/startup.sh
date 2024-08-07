# Startup script, run by hyprland/plasma on session start
# Do not set environment variables in here, they do not persist across session, instead use env.sh in here

LOG_FILE="${XDG_SCRIPT_HOME}/logs/startup.log"

time=$(date +"%T")
date=$(date +"%d-%m-%Y")
echo "Session started at $date: $time" > $LOG_FILE

## Set wallpaper
swww img /home/quoll/Pictures/wallpapers/cyber-asian-girl.png
