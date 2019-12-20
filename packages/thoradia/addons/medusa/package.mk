PKG_NAME="medusa"
PKG_VERSION="0.3.9"
PKG_SHA256="971220b9b23c2fa9021143a1a77f107a0d498e89f7c245aa3be1acfaba8beb65"
PKG_REV="7"
PKG_SITE="https://github.com/pymedusa/Medusa"
PKG_URL="https://github.com/pymedusa/Medusa/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain unrar"
PKG_SECTION="service"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Medusa"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="service.locale:0.0.0 tools.ffmpeg-tools:0.0.0"
PKG_SHORTDESC="${PKG_ADDON_NAME}: automatic video library manager for TV shows"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_VERSION}) watches for new episodes of your favorite shows, and when they are posted it does its magic."
PKG_MAINTAINER="thoradia"
PKG_DISCLAIMER="Keep it legal and carry on"

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -PR $(get_build_dir unrar)/unrar \
           ${ADDON_BUILD}/${PKG_ADDON_ID}/bin/

  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/medusa
    cp -PR ${PKG_BUILD}/* \
           ${ADDON_BUILD}/${PKG_ADDON_ID}/medusa/
}
