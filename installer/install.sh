#!/bin/bash
set -euo pipefail
IFS=$'\n\t'


#   ,---.           ,--.
#  '   .-'  ,---. ,-'  '-.,--.,--. ,---.
#  `.  `-. | .-. :'-.  .-'|  ||  || .-. |
#  .-'    |\   --.  |  |  '  ''  '| '-' '
#  `-----'  `----'  `--'   `----' |  |-'
#                                 `--'

INSTALLER_DIR="$HOME/.cache/dotinstaller"
# Packages to be installed via pacman
packages=(
	# cli tools
	fzf        # fuzzy finder
	zoxide     # better cd
	bat 	   # better cat
	bat-extras # includes batman, the better man and other things
	eza        # better ls
	ripgrep    # better grep
	# zsh
	zsh
	zsh-completions
	zsh-syntax-highlighting
	# sway
	sway	   # window manager
	waybar     # status bar
	mako	   # notification daemon
	swww	   # wallpaper daemon
	grim	   # wayland screenshot util
	slurp	   # needed for screenshots and screen capture on wayland
	# utilities
	rofi-wayland # dmenu replacer
	kitty	     # terminal emulator
	stow	     # symlink manager
	wl-clipboard # clipboard manager for wayland
	cliphist     # clipboard history
	lf		     # terminal file explorer
	# neovim
	neovim
	luarocks # needed by some plugins
	# fonts
	ttf-jetbrains-mono-nerd
	ttf-nerd-fonts-symbols
	ttf-noto-nerd
)

# Packages to be installed via the AUR
aurpacks=(
	swaylock-effects-git # lock screen
	grimblast-git # screenshots tool
	hererocks     # needed by some neovim plugins
	wlogout       # logout menu for wayland
	vesktop-bin   # less trash version of discord
	waybar-module-pacman-updates-git
	paru		  # AUR wrapper
)

function getConsent {
	echo
	read -p "Do you want to proceed? (y/N): " confirmation
	if [[ ! $confirmation =~ ^[Yy]$ ]]; then
		echo "Canceled"
		exit 0
	fi
	echo
}


#  ,--.         ,---.
#  |  |,--,--, /  .-' ,---.
#  |  ||      \|  `-,| .-. |
#  |  ||  ||  ||  .-'' '-' '
#  `--'`--''--'`--'   `---'

echo "Requirements for this script: "
echo "git and base-devel must be installed"
echo "you must have a github ssh key to be able to clone from github"
echo "this script assumes you are in a fresh arch install, it may or may not work otherwise"
echo
echo "These checks will not be performed until something fails and breaks"

getConsent

mkdir -p "$INSTALLER_DIR"
cd "$INSTALLER_DIR"
echo "Using $INSTALLER_DIR as directory\n"

echo "You are about to give sudo permissions to some random script you got off github"
echo "By continuing you accept that my shit bash skills are now your responsability and all damage is only your fault"

echo
read -p "Type 'CONFIRM' (all caps) to continue: " confirmation
if [[ $confirmation != 'CONFIRM' ]]; then
	echo "Canceled"
	exit 0
fi

# Get sudo permission if this script isn't already
[ "$UID" -eq 0 ] || exec sudo "$0" "$@"

#  ,------.                                             ,--.                ,--.          ,--.,--. 
#  |  .--. ' ,--,--. ,---.,--,--,--. ,--,--.,--,--,     |  |,--,--,  ,---.,-'  '-. ,--,--.|  ||  | 
#  |  '--' |' ,-.  || .--'|        |' ,-.  ||      \    |  ||      \(  .-''-.  .-'' ,-.  ||  ||  | 
#  |  | --' \ '-'  |\ `--.|  |  |  |\ '-'  ||  ||  |    |  ||  ||  |.-'  `) |  |  \ '-'  ||  ||  | 
#  `--'      `--`--' `---'`--`--`--' `--`--'`--''--'    `--'`--''--'`----'  `--'   `--`--'`--'`--'

echo
echo "The following packages will be installed:"
for package in "${packages[@]}"; do
	echo "- $package"
done

getConsent

echo "Updating system"
sudo pacman -Syu

echo "System updated"
echo "Installing packages"
sudo pacman -S --needed --noconfirm "${packages[@]}"

echo
echo "All pacman packages installed"

#    ,---.  ,--. ,--.,------.     ,--.                ,--.          ,--.,--.
#   /  O  \ |  | |  ||  .--. '    |  |,--,--,  ,---.,-'  '-. ,--,--.|  ||  |
#  |  .-.  ||  | |  ||  '--'.'    |  ||      \(  .-''-.  .-'' ,-.  ||  ||  |
#  |  | |  |'  '-'  '|  |\  \     |  ||  ||  |.-'  `) |  |  \ '-'  ||  ||  |
#  `--' `--' `-----' `--' '--'    `--'`--''--'`----'  `--'   `--`--'`--'`--'

echo
echo "The following AUR packages will be installed:"
for package in "${aurpacks[@]}"; do
	echo "- $package"
done

getConsent

echo "AUR install skipped due to my bash sucking too hard"
exit 0

BUILDS_DIR="$INSTALLER_DIR/aurbuild"
	
echo "Using $BUILDS_DIR for AUR install"
mkdir -p $BUILDS_DIR
cd "$BUILDS_DIR"

for package in "${aurpacks[@]}"; do
	echo
	echo "Installing $package"

	# if there was already a directory with the name of the package delete it so we can clone into there
	rm -fr "$package"
	git clone https://aur.archlinux.org/$package
	if [ $? -ne 0 ];then
		echo "Failed to clone $package"
		continue
	fi

	cd "$package"

	# pgp keys
	pgp=$(awk -F'[=()]' '/^validpgpkeys/ { for (i=2; i<=NF-1; i++) printf "%s ", $i }' PKGBUILD | tr -d '"')
	if [ -n "$pgp" ]; then
		gpg --receive-keys "$pgp" || { echo "Failed to receive GPG key for $package"; cd ..; continue; }
	fi
	
	# make the package, -Si installs the dependencies via pacman and installs
	makepkg -Si;
	if [ $? -ne 0 ];then
		echo "Failed to install $package"
	else
		echo "Installed $package"
	fi
	cd ..
done

cd $INSTALLER_DIR
read -p "Remove install directory? (y/N): " removedir
if [[ $removedir =~ ^[Yy] ]]; then
	rm -fr "$BUILDS_DIR"
	echo "Removed $BUILDS_DIR"
fi
echo "All AUR packages installed!"

#  ,--. ,--.                          ,---.           ,--.
#  |  | |  | ,---.  ,---. ,--.--.    '   .-'  ,---. ,-'  '-.,--.,--. ,---.
#  |  | |  |(  .-' | .-. :|  .--'    `.  `-. | .-. :'-.  .-'|  ||  || .-. |
#  '  '-'  '.-'  `)\   --.|  |       .-'    |\   --.  |  |  '  ''  '| '-' '
#   `-----' `----'  `----'`--'       `-----'  `----'  `--'   `----' |  |-'
#                                                                   `--'

# Link rofi as dmenu replacer

sudo ln -s /usr/bin/rofi /usr/bin/dmenu

