#!/usr/bin/env bash

echo "Current directory:"
pwd
echo "---------------------------------"
echo "Environment:"
env
echo "---------------------------------"
echo
echo "openssl:"
openssl version
echo "gpg:"
gpg --version


COL_GREEN="\e[32m"
COL_RED="\e[31m"
COL_RESET="\e[0m"
COL_YELLOW="\e[33;1m"

function log_error() {
    echo -e "${COL_RED}[ERROR  ] $*${COL_RESET}"
}

function log_info() {
    echo -e "${COL_YELLOW}[INFO   ] $*${COL_RESET}"
}

function log_success() {
    echo -e "${COL_GREEN}[SUCCESS] $*${COL_RESET}"
}

function log_debug() {
    echo -e "[DEBUG  ] $*"
}

log_error "Error logging color test"
log_info "Info logging color test"
log_success "Success logging color test"
log_debug "Debug logging"


uname=$(uname)
log_info "uname=$uname"
