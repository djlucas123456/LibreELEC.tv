PKG_NAME="rtorrent"
PKG_VERSION="0.9.6"
PKG_SHA256="8ca89ca9e8f0cf984198d030203087e93d24743dfa158091a5d225a70ca4c8cf"
PKG_REV="6"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/rakshasa/rtorrent"
PKG_URL="https://github.com/rakshasa/$PKG_NAME/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain curl libtorrent ncurses screen xmlrpc-c"
PKG_AUTORECONF="yes"
PKG_SECTION="service"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="rTorrent"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="thoradia"
PKG_SHORTDESC="$PKG_ADDON_NAME: quick and efficient BitTorrent client"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) is a quick and efficient BitTorrent client."
PKG_DISCLAIMER="Keep it legal and carry on"

PKG_CONFIGURE_OPTS_TARGET="--enable-static \
                           --disable-debug \
                           --disable-shared \
                           --with-xmlrpc-c=$SYSROOT_PREFIX/usr/bin/xmlrpc-c-config"

addon() {
  mkdir -p "$ADDON_BUILD/$PKG_ADDON_ID/bin"
  cp -L "$PKG_BUILD/.install_pkg/usr/bin/rtorrent" \
        "$(get_build_dir screen)/screen" \
        "$ADDON_BUILD/$PKG_ADDON_ID/bin"

  mkdir -p "$ADDON_BUILD/$PKG_ADDON_ID/doc"
  cp -L "$PKG_BUILD/doc/rtorrent.rc" \
        "$ADDON_BUILD/$PKG_ADDON_ID/doc"

  mkdir -p "$ADDON_BUILD/$PKG_ADDON_ID/lib"
  cp -L "$(get_build_dir xmlrpc-c)"/.install_pkg/usr/lib/libxmlrpc.so.? \
        "$(get_build_dir xmlrpc-c)"/.install_pkg/usr/lib/libxmlrpc_server.so.? \
        "$(get_build_dir xmlrpc-c)"/.install_pkg/usr/lib/libxmlrpc_util.so.? \
        "$ADDON_BUILD/$PKG_ADDON_ID/lib"
}
