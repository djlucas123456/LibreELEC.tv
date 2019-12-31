PKG_NAME="libmediainfo-shared"
PKG_VERSION="19.09"
PKG_SHA256="4cc409f6e5a0bfa95f8c48d95d31054a4f7b7ef0d03b1ab38abcd534d8688038"
PKG_LICENSE="GPL"
PKG_SITE="http://mediaarea.net/en/MediaInfo/Download/Source"
PKG_URL="https://github.com/MediaArea/MediaInfoLib/archive/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain libzen zlib"
PKG_LONGDESC="MediaInfo is a convenient unified display of the most relevant technical and tag data for video and audio files"
PKG_TOOLCHAIN="manual"

configure_target() {
  export CPPFLAGS="${CPPFLAGS} -I$(get_install_dir libzen)/usr/include"
  PATH="$(get_build_dir libzen)/Project/GNU/Library:${PATH}"
  cd Project/GNU/Library
    do_autoreconf
    ./configure \
          --host=${TARGET_NAME} \
          --build=${HOST_NAME} \
          --disable-static \
          --enable-shared \
          --prefix=/usr \
          --enable-visibility
}

make_target() {
    make
}
