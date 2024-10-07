#!/bin/bash
# shellcheck disable=SC2086

# ---------------------------------------------------------------------------------------
# extensions_xdebug_prepare() - Prepare the system for this extension
#
# @return List of packages
#
extensions_xdebug_prepare() {
    echo ""
}

# ---------------------------------------------------------------------------------------
# extensions_xdebug_build_packages() - List package names only needed during build time
#
# @return List of packages
#
extensions_xdebug_build_packages() {
    local packages="
    "
    echo $packages
}

# ---------------------------------------------------------------------------------------
# extensions_xdebug_runtime_packages() - List package names needed during runtime
#
# @return List of packages
#
extensions_xdebug_runtime_packages() {
    local packages="
    "
    echo $packages
}

# ---------------------------------------------------------------------------------------
# extensions_xdebug_url() - Returns the URL leading to the source code archive
#
# @return string
#
extensions_xdebug_url() {
    echo "https://xdebug.org/files/xdebug-3.4.0beta1.tgz"
}

# ---------------------------------------------------------------------------------------
# extensions_xdebug_configure_arguments() - Returns additional configure arguments
#
# @return string
#
extensions_xdebug_configure_arguments() {
    echo ""
}
