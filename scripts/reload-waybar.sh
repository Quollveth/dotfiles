notify-send --expire-time 1000 "reloading waybar"

pkill waybar
hyprctl dispatch exec waybar
