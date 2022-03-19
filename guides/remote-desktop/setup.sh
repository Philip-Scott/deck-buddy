#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

#/ Description: Install Krfb and configure network access
#/ Options:
#/   --help: Display this help message
usage() { grep '^#/' "$0" | cut -c4- ; exit 0 ; }
expr "$*" : ".*--help" > /dev/null && usage

readonly LOG_FILE="/tmp/$(basename "$0").log"
info()    { echo "[INFO]    $*" | tee -a "$LOG_FILE" >&2 ; }
warning() { echo "[WARNING] $*" | tee -a "$LOG_FILE" >&2 ; }
error()   { echo "[ERROR]   $*" | tee -a "$LOG_FILE" >&2 ; }
fatal()   { echo "[FATAL]   $*" | tee -a "$LOG_FILE" >&2 ; exit 1 ; }

exit () {
    info "Please share your feedback at https://github.com/Philip-Scott/deck-buddy/issues"
}

trap exit EXIT

flatpak install flathub org.kde.krfb -y

# We need to give krfb access to the network, or else the service will not be available
sudo flatpak override org.kde.krfb --share=network

xdg-open https://github.com/Philip-Scott/deck-buddy/blob/master/guides/remote-desktop/readme.md > /dev/null &

info "installation completed! Press enter to quit"
