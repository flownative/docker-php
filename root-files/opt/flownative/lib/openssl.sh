#!/bin/bash
# shellcheck disable=SC1090

# =======================================================================================
# LIBRARY: OpenSSL
# =======================================================================================

# Load helper lib

. "${FLOWNATIVE_LIB_PATH}/log.sh"

# ---------------------------------------------------------------------------------------
# openssl_env() - Load global environment variables for configuring OpenSSL
#
# @global OPENSSL_* The OPENSSL_* environment variables
# @return "export" statements which can be passed to eval()
#
openssl_env() {
    cat <<"EOF"
export OPENSSL_LEGACY_MODE="${OPENSSL_LEGACY_MODE:-false}"
EOF
}

# ---------------------------------------------------------------------------------------
# openssl_initialize() - Initialize OpenSSL configuration
#
# @global OPENSSL_* The OPENSSL_* environment variables
# @return void
#
openssl_initialize() {
    if is_boolean_yes "${OPENSSL_LEGACY_MODE}"; then
        info "OpenSSL: Legacy providers are enabled"
        cat >> /usr/lib/ssl/extra-options.cnf << EOF

[openssl_init]
providers = provider_sect

[provider_sect]
default = default_sect
legacy = legacy_sect

[default_sect]
activate = 1

[legacy_sect]
activate = 1
EOF
    else
        info "OpenSSL: Legacy providers are disabled"
    fi
 }
