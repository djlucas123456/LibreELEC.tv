PKG_NAME="flexget"
PKG_VERSION="3.0.18"
PKG_SHA256="069471d6bc4ebbadb0f6e2360462574b584a2063ce76f97dbf876b8412cdc3c7"
PKG_REV="12"
PKG_SITE="https://flexget.com"
PKG_URL="https://github.com/Flexget/Flexget/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain cffi:host crossenv:host libyaml Python3"
PKG_SECTION="service"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="FlexGet"
PKG_ADDON_TYPE="xbmc.service"
PKG_SHORTDESC="${PKG_ADDON_NAME}: automate downloading or processing content from different sources"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_VERSION}) is a program aimed to automate downloading or processing content (torrents, podcasts, etc.) from different sources like RSS-feeds, html-pages, various sites and more."
PKG_MAINTAINER="thoradia"
PKG_DISCLAIMER="Keep it legal and carry on"

pre_configure_target() {
  echo >>requirements.txt <<EOF
deluge-client
mechanize
python-telegram-bot
transmissionrpc
EOF
}

make_target() {
  python3 -m crossenv ${SYSROOT_PREFIX}/usr/bin/python3 crossenv
  . crossenv/bin/activate
  python3 -m pip install --no-compile --target=${INSTALL} .
}

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}
  cp -LR ${PKG_BUILD}/.install_pkg \
         ${ADDON_BUILD}/${PKG_ADDON_ID}/libs
}
