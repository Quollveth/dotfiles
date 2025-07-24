export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')"
export LC_ALL=C.UTF-8

# --- Default programs:
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="librewolf"
export FILES="thunar"

# --- XDG dirs
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache

# --- Extra dirs
export SCREENSHOTS_DIR=$HOME/Pictures/Screenshots/
export WALLPAPERS_DIR=$HOME/Pictures/Wallpapers/
export SCRIPTS_DIR=$HOME/scripts/

export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml

## --- PATH
export PATH="$PATH:$SCRIPTS_DIR"
export PATH="$PATH:$XDG_CONFIG_HOME/rofi/scripts"

# Go
export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"

# Bun
export BUN_INSTALL="$HOME/.bun" 
export PATH="$BUN_INSTALL/bin:$PATH" 

# Android
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin/
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/ 
export ANDROID_SDK_ROOT='/opt/android-sdk'
export ANDROID_SDK='/opt/android-sdk'
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1 
export ANDROID_AVD_HOME="$XDG_CONFIG_HOME/.android/avd"
export PATH=$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$PATH
# Flutter
export PATH="/opt/flutter/bin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"

# -- Wine
export WINEARCH=win64
export WINEPREFIX=$HOME/.wine 

