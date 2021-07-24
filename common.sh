#!/bin/bash

function detect_os() {
	# Adapted from https://unix.stackexchange.com/questions/6345/how-can-i-get-distribution-name-and-version-number-in-a-simple-shell-script
	if [ -f /etc/os-release ]; then
		# freedesktop.org and systemd
		# shellcheck disable=SC1091
		. /etc/os-release
		echo "$NAME"
	else
		# Fall back to uname, e.g. "Darwin" on OSX, "Linux <version>"
		uname -s
	fi

}

function install_package() {
	OS=$(detect_os)
	if [ "$OS" = "Ubuntu" ]; then
		sudo apt-get install -y "$1"
	elif [ "$OS" = "Fedora" ]; then
		sudo dnf install -y "$1"
	elif [ "$OS" = "Darwin" ]; then
		brew install "$1"
	else
		echo >&2 "Cannot detect install command, aborting."
		exit 1
	fi
}

function safe_symlink() {
	if ! cmp --silent -- "$1" "$2"; then
		echo "Files $1 and $2 differ, saving a backup to $2.bak"
		cp "$2"{,.bak}
	fi
	ln -sf "$1" "$2"
}
