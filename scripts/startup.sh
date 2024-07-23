# Startup script, run by hyprland/plasma on session start
# Do not set environment variables in here, they do not persist across session, instead use env.sh in here

SCRIPT_DIR="$HOME/dotfiles/scripts"
LOG_FILE="$SCRIPT_DIR/logs/startup.log"

time=$(date +"%T")
date=$(date +"%d-%m-%Y")
echo "Session started at $date: $time" > $LOG_FILE
