#!/bin/bash
# shellcheck disable=SC2086

# https://learn.microsoft.com/en-us/sql/connect/php/installation-tutorial-linux-mac
# https://learn.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server
#
# ---------------------------------------------------------------------------------------
# extensions_sqlsrv_prepare() - Prepare the system for this extension
#
# @return string
#
extensions_sqlsrv_prepare() {
    curl https://packages.microsoft.com/keys/microsoft.asc | tee /etc/apt/trusted.gpg.d/microsoft.asc
    curl https://packages.microsoft.com/config/debian/11/prod.list | tee /etc/apt/sources.list.d/mssql-release.list
    apt-get update
    ACCEPT_EULA=Y apt-get install -y msodbcsql18
    apt-get install -y unixodbc-dev
    # optional: kerberos library for debian-slim distributions
    #apt-get install -y libgssapi-krb5-2

    echo ""
}

# ---------------------------------------------------------------------------------------
# extensions_sqlsrv_build_packages() - List package names only needed during build time
#
# @return List of packages
#
extensions_sqlsrv_build_packages() {
    local packages=""
    echo $packages
}

# ---------------------------------------------------------------------------------------
# extensions_sqlsrv_runtime_packages() - List package names needed during runtime
#
# @return List of packages
#
extensions_sqlsrv_runtime_packages() {
    echo ""
}

# ---------------------------------------------------------------------------------------
# extensions_sqlsrv_url() - Returns the URL leading to the source code archive
#
# @return string
#
extensions_sqlsrv_url() {
     echo "https://pecl.php.net/get/sqlsrv-5.12.0.tgz"
}

# ---------------------------------------------------------------------------------------
# extensions_sqlsrv_configure_arguments() - Returns additional configure arguments
#
# @return string
#
extensions_sqlsrv_configure_arguments() {
    echo "--enable-sqlsrv"
}
