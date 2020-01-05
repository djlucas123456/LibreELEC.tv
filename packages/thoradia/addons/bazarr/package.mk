PKG_NAME="bazarr"
PKG_VERSION="0.8.4.1"
PKG_SHA256="ef3bc2f65fd0c9e9e228c2b28c0b648776907767056590c2179133bdb61ba2d7"
PKG_REV="14"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/morpheus65535/bazarr"
PKG_URL="https://github.com/morpheus65535/bazarr/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain cffi:host crossenv:host libxslt Python3"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Bazarr"
PKG_ADDON_TYPE="xbmc.service"
PKG_SECTION="service"
PKG_SHORTDESC="${PKG_ADDON_NAME}: subtitles for Sonarr and Radarr"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_VERSION}) is a companion application to Sonarr and Radarr. It manages and downloads subtitles based on your requirements. You define your preferences by TV show or movies and Bazarr takes care of everything for you. "
PKG_MAINTAINER="thoradia"
PKG_DISCLAIMER="Keep it legal and carry on"

make_target() {
  for d in bin/Linux/i386 bin/MacOSX bin/Windows libs2 screenshot; do
    rm -rf ${d}
  done
  python -m crossenv ${SYSROOT_PREFIX}/usr/bin/python3 .crossenv
  . .crossenv/bin/activate
  pip install --no-compile --target=libs lxml
}

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/libs
    cp -PR ${PKG_BUILD}/* \
           ${ADDON_BUILD}/${PKG_ADDON_ID}/libs
}
