#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

#/ Description: Open the Add Non-Steam Game dialog
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

xdg-open steam://AddNonSteamGame > /dev/null &

info "Launching Steam's 'Add Non-Steam Game' dialog..."
