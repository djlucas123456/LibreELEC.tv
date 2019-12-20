PKG_NAME="cffi"
PKG_VERSION="1.13.2"
PKG_LICENSE="MIT"
PKG_SITE="http://cffi.readthedocs.io/"
PKG_DEPENDS_HOST="toolchain libffi:host Python3:host"
PKG_LONGDESC="Foreign Function Interface for Python calling C code"
PKG_TOOLCHAIN="manual"

make_host() {
    python3 -m pip install cffi==${PKG_VERSION}
}
