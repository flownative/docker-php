#!/bin/bash
# shellcheck disable=SC2086

# ---------------------------------------------------------------------------------------
# extensions_mongodb_prepare() - Prepare the system for this extension
#
# @return List of packages
#
extensions_mongodb_prepare() {
    echo ""
}

# ---------------------------------------------------------------------------------------
# extensions_mongodb_build_packages() - List package names only needed during build time
#
# @return List of packages
#
extensions_mongodb_build_packages() {
    local packages="
    "
    echo $packages
}

# ---------------------------------------------------------------------------------------
# extensions_mongodb_runtime_packages() - List package names needed during runtime
#
# @return List of packages
#
extensions_mongodb_runtime_packages() {
    local packages="
    "
    echo $packages
}

# ---------------------------------------------------------------------------------------
# extensions_mongodb_url() - Returns the URL leading to the source code archive
#
# For new releases see: https://github.com/mongodb/mongo-php-driver/releases
#
# @return string
#
extensions_mongodb_url() {
    echo "https://github.com/mongodb/mongo-php-driver/releases/download/2.2.0/mongodb-2.2.0.tgz"
}

# ---------------------------------------------------------------------------------------
# extensions_mongodb_configure_arguments() - Returns additional configure arguments
#
# @return string
#
extensions_mongodb_configure_arguments() {
    echo ""
}
