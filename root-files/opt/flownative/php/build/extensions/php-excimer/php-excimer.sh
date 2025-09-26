#!/bin/bash
# shellcheck disable=SC2086

# ---------------------------------------------------------------------------------------
# extensions_php-excimer_prepare() - Prepare the system for this extension
#
# @return List of packages
#
extensions_php-excimer_prepare() {
    echo ""
}

# ---------------------------------------------------------------------------------------
# extensions_php-excimer_build_packages() - List package names only needed during build time
#
# @return List of packages
#
extensions_php-excimer_build_packages() {
    local packages="
    "
    echo $packages
}

# ---------------------------------------------------------------------------------------
# extensions_php-excimer_runtime_packages() - List package names needed during runtime
#
# @return List of packages
#
extensions_php-excimer_runtime_packages() {
    local packages="
    "
    echo $packages
}

# ---------------------------------------------------------------------------------------
# extensions_php-excimer_url() - Returns the URL leading to the source code archive
#
# See https://github.com/wikimedia/php-excimer/tags
#
# @return string
#
extensions_php-excimer_url() {
    echo "https://github.com/wikimedia/php-excimer/archive/refs/tags/1.2.5.tar.gz"
}

# ---------------------------------------------------------------------------------------
# extensions_php-excimer_configure_arguments() - Returns additional configure arguments
#
# @return string
#
extensions_php-excimer_configure_arguments() {
    echo ""
}
