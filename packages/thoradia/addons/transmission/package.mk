PKG_NAME="transmission"
PKG_VERSION="2.94"
PKG_SHA256="35442cc849f91f8df982c3d0d479d650c6ca19310a994eccdaa79a4af3916b7d"
PKG_REV="21"
PKG_LICENSE="OSS"
PKG_SITE="http://www.transmissionbt.com/"
PKG_URL="https://github.com/transmission/transmission-releases/raw/master/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain curl libevent"
PKG_TOOLCHAIN="cmake-make"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Transmission"
PKG_ADDON_TYPE="xbmc.service"
PKG_SECTION="service"
PKG_SHORTDESC="${PKG_ADDON_NAME}: a fast, easy and free BitTorrent client"
PKG_LONGDESC="${PKG_ADDON_NAME} (${PKG_VERSION}) is a fast, easy and free BitTorrent client."
PKG_MAINTAINER="thoradia"
PKG_DISCLAIMER="Keep it legal and carry on"

PKG_CMAKE_OPTS_TARGET="-DENABLE_DAEMON=ON \
                       -DENABLE_GTK=OFF \
                       -DENABLE_QT=OFF \
                       -DENABLE_MAC=OFF \
                       -DENABLE_UTILS=OFF \
                       -DENABLE_CLI=ON \
                       -DENABLE_TESTS=OFF \
                       -DENABLE_LIGHTWEIGHT=OFF \
                       -DENABLE_UTP=ON \
                       -DENABLE_NLS=OFF \
                       -DINSTALL_DOC=OFF \
                       -DINSTALL_LIB=OFF \
                       -DUSE_SYSTEM_EVENT2=ON \
                       -DUSE_SYSTEM_DHT=OFF \
                       -DUSE_SYSTEM_MINIUPNPC=OFF \
                       -DUSE_SYSTEM_NATPMP=OFF \
                       -DUSE_SYSTEM_UTP=OFF \
                       -DUSE_SYSTEM_B64=OFF \
                       -DWITH_CRYPTO=openssl \
                       -DWITH_SYSTEMD=OFF"

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}
    cp -PR ${PKG_BUILD}/.install_pkg/usr/bin \
           ${PKG_BUILD}/.install_pkg/usr/share/transmission/web \
           ${ADDON_BUILD}/${PKG_ADDON_ID}
}
