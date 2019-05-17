pkg_name=gnucobol
pkg_origin=moutons
pkg_version="3.0-rc1"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("Apache-2.0")
pkg_source="http://sourceforge.net/projects/open-cobol/files/gnu-cobol/3.0/${pkg_name}-${pkg_version}.tar.gz"
#pkg_source="//sourceforge.net/projects/open-cobol/files/gnu-cobol/3.0/gnucobol-3.0-rc1.tar.gz"
#
# pkg_filename="${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="e55aeea6b1f77e763b4cd4b520c78eb06da7671b4dcc76463fd0237dbf2e4816"
pkg_deps=(
    core/db
    core/glibc
    core/gmp
)
pkg_build_deps=(
    core/coreutils
    core/diffutils
    core/make
    core/gcc
    core/m4
    core/perl
)
pkg_lib_dirs=(lib)
# pkg_include_dirs=(include)
pkg_bin_dirs=(bin)
# pkg_pconfig_dirs=(lib/pconfig)
# pkg_svc_run="haproxy -f $pkg_svc_config_path/haproxy.conf"
# pkg_exports=(
#   [host]=srv.address
#   [port]=srv.port
#   [ssl-port]=srv.ssl.port
# )
# pkg_exposes=(port ssl-port)
# pkg_binds=(
#   [database]="port host"
# )
# pkg_binds_optional=(
#   [storage]="port host"
# )
# pkg_interpreters=(bin/bash)
# pkg_svc_user="hab"
# pkg_svc_group="$pkg_svc_user"
# pkg_description="Some description."
# pkg_upstream_url="http://example.com/project-name"

do_build() {
    ./configure --prefix="${pkg_prefix}" \
                --with-external-db       \
                --without-lua

    make

    make check

    make test

    make install
}

do_check() {
    make checkall
}

do_install() {
    do_default_install
}