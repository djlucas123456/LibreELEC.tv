PKG_NAME="php"
PKG_VERSION="7.3.15"
PKG_SHA256="de7ae7cf3d1dbb2824975b26b32991dac2b732886ec22075b8c53b261b018166"
PKG_LICENSE="PHP"
PKG_SITE="http://www.php.net"
PKG_URL="http://www.php.net/distributions/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain curl pcre"
PKG_LONGDESC="The PHP Interpreter"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="--disable-all \
                           --disable-cli \
                           --disable-phpdbg \
                           --enable-cgi \
                           --enable-json \
                           --enable-mbstring \
                           --with-curl=${SYSROOT_PREFIX}/usr \
                           --with-openssl=${SYSROOT_PREFIX}/usr \
                           --with-pcre-regex \
                           --with-zlib=${SYSROOT_PREFIX}/usr"

pre_configure_target() {
  export CFLAGS="${CFLAGS} -pthread"
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
    cp sapi/cgi/php-cgi ${INSTALL}/usr/bin/php
}
