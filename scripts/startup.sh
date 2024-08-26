# Startup script, run by sway on session start

LOG_FILE="${XDG_SCRIPT_HOME}/logs/startup.log"

time=$(date +"%T")
date=$(date +"%d-%m-%Y")
echo "Session started at $date: $time" > $LOG_FILE

## Set wallpaper
swww img WALLPAPERS_DIR/desktop/cyber-asian-girl.png


