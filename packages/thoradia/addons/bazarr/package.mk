PKG_NAME="bazarr"
PKG_VERSION="0.7.0"
PKG_SHA256="e0e6a277b657ed01e5cb0c62b3368d6598699e6c57acf8e7afa8e8a94dec63dc"
PKG_REV="2"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/morpheus65535/bazarr"
PKG_URL="https://github.com/morpheus65535/bazarr/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain gevent python_bazarr"
PKG_SECTION="service"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Bazarr"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="thoradia"
PKG_SHORTDESC="$PKG_ADDON_NAME: subtitles for Sonarr and Radarr"
PKG_LONGDESC="$PKG_ADDON_NAME ($PKG_VERSION) is a companion application to Sonarr and Radarr. It manages and downloads subtitles based on your requirements. You define your preferences by TV show or movies and Bazarr takes care of everything for you. "
PKG_DISCLAIMER="Keep it legal and carry on"

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bazarr

  cp -PR $PKG_BUILD/* \
         $ADDON_BUILD/$PKG_ADDON_ID/bazarr

  cp -PR $(get_build_dir gevent)/.install_pkg/usr/lib/python2.7/site-packages/gevent \
         $(get_build_dir python_bazarr)/.install_pkg/usr/lib/python2.7/site-packages/greenlet*/greenlet* \
         $(get_build_dir Python2)/Lib/unittest \
         $ADDON_BUILD/$PKG_ADDON_ID/bazarr/libs
}
