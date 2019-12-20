PKG_NAME="libtorrent-rasterbar"
PKG_VERSION="1_2_4"
PKG_SHA256="f1ae9ccca0a9013b694d53c12cfd4f9cc21f9cf227789fd3d62a876c7f35720f"
PKG_LICENSE="https://github.com/arvidn/libtorrent/blob/master/LICENSE"
PKG_SITE="http://libtorrent.org/"
PKG_URL="https://github.com/arvidn/libtorrent/archive/libtorrent-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain boost libiconv openssl"
PKG_LONGDESC="An efficient feature complete C++ bittorrent implementation"

PKG_BUILD_FLAGS="+pic"
PKG_CMAKE_OPTS_TARGET="-Dboost-python-module-name=python \
                       -DBoost_USE_STATIC_LIBS=ON \
                       -DBUILD_SHARED_LIBS=OFF \
                       -Dpython-bindings=ON"
