#!/bin/bash
# shellcheck disable=SC2086

# ---------------------------------------------------------------------------------------
# extensions_php-spx_prepare() - Prepare the system for this extension
#
# @return List of packages
#
extensions_php-spx_prepare() {
    echo ""
}

# ---------------------------------------------------------------------------------------
# extensions_php-spx_build_packages() - List package names only needed during build time
#
# @return List of packages
#
extensions_php-spx_build_packages() {
    local packages="
    "
    echo $packages
}

# ---------------------------------------------------------------------------------------
# extensions_php-spx_runtime_packages() - List package names needed during runtime
#
# @return List of packages
#
extensions_php-spx_runtime_packages() {
    local packages="
    "
    echo $packages
}

# ---------------------------------------------------------------------------------------
# extensions_php-spx_url() - Returns the URL leading to the source code archive
#
# @return string
#
extensions_php-spx_url() {
    echo "https://github.com/NoiseByNorthwest/php-spx/archive/refs/tags/v0.4.20.tar.gz"
}

# ---------------------------------------------------------------------------------------
# extensions_php-spx_configure_arguments() - Returns additional configure arguments
#
# @return string
#
extensions_php-spx_configure_arguments() {
    echo ""
}
