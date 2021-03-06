#!/usr/bin/env bash

set -e

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
echo "ruby:"
ruby --version
which ruby
#echo "rvm:"
#rvm --version
#rvm list
#rvm use ruby-2.7
echo "gem:"
gem --version
which gem
gem install bundler
echo "Bundler:"
bundle --version
which bundle

if [ $(uname) == "Linux" ]; then
    echo "zip:"
    zip --help
fi


echo "-----------------------------------"


COL_GREEN="\e[32m"
COL_RED="\e[31m"
COL_RESET="\e[0m"
COL_YELLOW="\e[33;1m"

source $(dirname $0)/logger.inc

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
printenv GPG_SECRET | gpg --batch --yes --decrypt \
    --passphrase-fd 0 \
    --output .ci/a-encrypted-file2.txt .ci/a-encrypted-file.txt.gpg
cat .ci/a-encrypted-file2.txt

ls -la .ci
