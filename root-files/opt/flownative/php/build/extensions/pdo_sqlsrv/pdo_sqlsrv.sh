#!/bin/bash
# shellcheck disable=SC2086

# https://learn.microsoft.com/en-us/sql/connect/php/installation-tutorial-linux-mac
# https://learn.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server
#
# ---------------------------------------------------------------------------------------
# extensions_pdo_sqlsrv_prepare() - Prepare the system for this extension
#
# @return string
#
extensions_pdo_sqlsrv_prepare() {
    echo ""
}

# ---------------------------------------------------------------------------------------
# extensions_pdo_sqlsrv_build_packages() - List package names only needed during build time
#
# @return List of packages
#
extensions_pdo_sqlsrv_build_packages() {
    local packages=""
    echo $packages
}

# ---------------------------------------------------------------------------------------
# extensions_pdo_sqlsrv_runtime_packages() - List package names needed during runtime
#
# @return List of packages
#
extensions_pdo_sqlsrv_runtime_packages() {
    echo ""
}

# ---------------------------------------------------------------------------------------
# extensions_pdo_sqlsrv_url() - Returns the URL leading to the source code archive
#
# @return string
#
extensions_pdo_sqlsrv_url() {
     echo "https://pecl.php.net/get/pdo_sqlsrv-5.12.0.tgz"
}

# ---------------------------------------------------------------------------------------
# extensions_pdo_sqlsrv_configure_arguments() - Returns additional configure arguments
#
# @return string
#
extensions_pdo_sqlsrv_configure_arguments() {
    echo "--enable-pdo --with-pdo-sqlsrv"
}
