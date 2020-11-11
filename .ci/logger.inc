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
