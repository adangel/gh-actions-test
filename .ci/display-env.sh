#!/usr/bin/env bash

echo "Current directory: $(pwd)"
echo "Home directory: ${HOME}"
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

echo "Here comes the secret:"
echo ${EXAMPLE_KEY}

#
# see https://docs.github.com/en/free-pro-team@latest/actions/reference/encrypted-secrets
#
# encrypt with:
#gpg --symmetric --cipher-algo AES256 my_secret.json
#5XIqgkQKCMO6ToN5d1AYsHaxEiosqNgT

echo "------------------------------"
# --batch to prevent interactive command
# --yes to assume "yes" for questions
gpg --batch --yes --decrypt --passphrase="$GPG_SECRET" \
    --output .ci/a-encrypted-file.txt .ci/a-encrypted-file.txt.gpg
cat .ci/a-encrypted-file.txt

echo "------------------------------------"
echo "second way..."
exec -a "echo" echo "$GPG_SECRET" | gpg --batch --yes --decrypt \
    --passphrase-fd 0 \
    --output .ci/a-encrypted-file2.txt .ci/a-encrypted-file.txt.gpg
cat .ci/a-encrypted-file2.txt

ls -la .ci
