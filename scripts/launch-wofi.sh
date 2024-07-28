CONFIG="${XDG_CONFIG_HOME}/wofi/config"
STYLE="${XDG_CONFIG_HOME}/wofi/style.css"

if [[ ! $(pidof wofi) ]]; then
    wofi --show drun --conf "${CONFIG}" --style "${STYLE}"
else
    pkill wofi
fi
