PKG_NAME="libmediainfo-shared"
PKG_VERSION="17.10"
PKG_SHA256="2e5622b685f4bca23726e6646da542861edb01c26a73502a14d1b553f9a18dfb"
PKG_LICENSE="GPL"
PKG_SITE="http://mediaarea.net/en/MediaInfo/Download/Source"
PKG_URL="https://github.com/MediaArea/MediaInfoLib/archive/v$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="MediaInfoLib-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain libzen zlib"
PKG_SHORTDESC="MediaInfo is a convenient unified display of the most relevant technical and tag data for video and audio files"

PKG_TOOLCHAIN="manual"

make_target() {
  cd Project/GNU/Library
  do_autoreconf
  ./configure \
        --host=$TARGET_NAME \
        --build=$HOST_NAME \
        --disable-static \
        --enable-shared \
        --prefix=/usr \
        --enable-visibility \
        --disable-libcurl \
        --disable-libmms
  make
}
