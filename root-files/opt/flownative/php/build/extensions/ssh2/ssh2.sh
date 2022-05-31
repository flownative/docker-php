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
# For new releases see: https://pecl.php.net/package/ssh2
#
# @return string
#
extensions_ssh2_url() {
     echo "https://pecl.php.net/get/ssh2-1.3.1.tgz"
}

# ---------------------------------------------------------------------------------------
# extensions_ssh2_configure_arguments() - Returns additional configure arguments
#
# @return string
#
extensions_ssh2_configure_arguments() {
    echo ""
}
