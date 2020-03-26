#!/bin/bash
# shellcheck disable=SC1090

set -o errexit
set -o nounset
set -o pipefail

# Load lib
. "${FLOWNATIVE_LIB_PATH}/banner.sh"
. "${FLOWNATIVE_LIB_PATH}/php-fpm.sh"
. "${FLOWNATIVE_LIB_PATH}/supervisor.sh"

banner_flownative PHP

eval "$(php_fpm_env)"
eval "$(supervisor_env)"

php_fpm_initialize

supervisor_initialize
supervisor_start

trap 'supervisor_stop' SIGINT SIGTERM

if [[ "$*" = *"run"* ]]; then
    supervisor_pid=$(supervisor_get_pid)
    info "Entrypoint: Start up complete"
    # We can't use "wait" because supervisord is not a direct child of this shell:
    while [ -e "/proc/${supervisor_pid}" ]; do sleep 1.1; done
    info "Good bye 👋"
else
    "$@"
fi
