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

errorExit() {
    error "krfb setup failed. Please share your feedback at https://raw.githubusercontent.com/Philip-Scott/deck-buddy/issues"
    read
}

if [[ "${BASH_SOURCE[0]}" = "$0" ]]; then
    trap errorExit EXIT

    flatpak install org.kde.krfb -y

    # We need to give krfb access to the network, or else the service will not be available
    sudo flatpak override org.kde.krfb --share=network

    xdg-open https://raw.githubusercontent.com/Philip-Scott/deck-buddy/master/guides/remote-desktop/

    info "installation completed!"
    read
fi
