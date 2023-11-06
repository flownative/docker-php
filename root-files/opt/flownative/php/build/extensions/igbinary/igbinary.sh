#!/bin/bash
# shellcheck disable=SC2086

# ---------------------------------------------------------------------------------------
# extensions_igbinary_prepare() - Prepare the system for this extension
#
# @return List of packages
#
extensions_igbinary_prepare() {
    echo ""
}

# ---------------------------------------------------------------------------------------
# extensions_igbinary_build_packages() - List package names only needed during build time
#
# @return List of packages
#
extensions_igbinary_build_packages() {
    local packages=""
    echo $packages
}

# ---------------------------------------------------------------------------------------
# extensions_igbinary_runtime_packages() - List package names needed during runtime
#
# @return List of packages
#
extensions_igbinary_runtime_packages() {
    echo ""
}

# ---------------------------------------------------------------------------------------
# extensions_igbinary_url() - Returns the URL leading to the source code archive
#
# @return string
#
extensions_igbinary_url() {
    echo "https://github.com/igbinary/igbinary/archive/refs/tags/3.2.14.tar.gz"
}

# ---------------------------------------------------------------------------------------
# extensions_igbinary_configure_arguments() - Returns additional configure arguments
#
# @return string
#
extensions_igbinary_configure_arguments() {
    echo "--enable-igbinary"
}
