#!/bin/bash
# shellcheck disable=SC2086

# ---------------------------------------------------------------------------------------
# extensions_ssh2_prepare() - Prepare the system for this extension
#
# @return List of packages
#
extensions_ssh2_prepare() {
    echo ""
}

# ---------------------------------------------------------------------------------------
# extensions_ssh2_build_packages() - List package names only needed during build time
#
# @return List of packages
#
extensions_ssh2_build_packages() {
    local packages="libssl-dev libssh2-1-dev"
    echo $packages
}

# ---------------------------------------------------------------------------------------
# extensions_ssh2_runtime_packages() - List package names needed during runtime
#
# @return List of packages
#
extensions_ssh2_runtime_packages() {
    echo ""
}

# ---------------------------------------------------------------------------------------
# extensions_ssh2_url() - Returns the URL leading to the source code archive
#
# For new releases see: https://github.com/php/pecl-networking-ssh2/
#
# @return string
#
extensions_ssh2_url() {
     echo "https://github.com/php/pecl-networking-ssh2/archive/refs/tags/1.4.1.tar.gz"
}

# ---------------------------------------------------------------------------------------
# extensions_ssh2_configure_arguments() - Returns additional configure arguments
#
# @return string
#
extensions_ssh2_configure_arguments() {
    echo ""
}
