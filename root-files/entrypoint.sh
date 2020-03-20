#!/bin/bash
# shellcheck disable=SC1090

set -o errexit
set -o nounset
set -o pipefail

# Load lib
. "${FLOWNATIVE_LIB_PATH}/banner.sh"
. "${FLOWNATIVE_LIB_PATH}/validation.sh"
. "${FLOWNATIVE_LIB_PATH}/php-fpm.sh"

eval "$(php_fpm_env)"

banner_flownative PHP

if [[ "$*" = *"run"* ]]; then
    php_fpm_initialize

    trap 'php_fpm_stop' SIGINT SIGTERM
    php_fpm_start

    wait "$(php_fpm_get_pid)"
    # This line will not be reached, because a trap handles termination
else
    "$@"
fi
