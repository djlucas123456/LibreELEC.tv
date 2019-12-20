PKG_NAME="deluge"
PKG_VERSION="2.0.3"
PKG_SHA256="5b9831ee06126cb31e53007a2974f20c60f591367689c346ee2621429a29065c"
PKG_REV="31"
PKG_LICENSE="GPLv3"
PKG_SITE="http://deluge-torrent.org/"
PKG_URL="https://github.com/deluge-torrent/deluge/archive/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain cffi:host crossenv:host libtorrent-rasterbar Python3"
PKG_SECTION="service"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Deluge"
PKG_ADDON_TYPE="xbmc.service"
PKG_SHORTDESC="${PKG_ADDON_NAME}: lightweight, free software, cross-platform BitTorrent client"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_VERSION}) is a lightweight, free software, cross-platform BitTorrent client."
PKG_MAINTAINER="thoradia"
PKG_DISCLAIMER="Keep it legal and carry on"

make_target() {
  echo ${PKG_VERSION} > RELEASE-VERSION
  python3 -m crossenv ${SYSROOT_PREFIX}/usr/bin/python3 crossenv
  . crossenv/bin/activate
  python3 -m pip install --target=${INSTALL} .
  find ${INSTALL} -name \*.py -type f -exec rm -f {} +
}

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/libs
    cp -LR ${PKG_BUILD}/.install_pkg/* \
           $(get_build_dir libtorrent-rasterbar)/.install_pkg/usr/lib/libtorrent-rasterbar.so.?? \
           $(get_build_dir libtorrent-rasterbar)/.install_pkg/usr/lib/python*/site-packages/* \
           ${ADDON_BUILD}/${PKG_ADDON_ID}/libs
}
