PKG_NAME="cffi"
PKG_VERSION="1.14.0"
PKG_SHA256="2d384f4a127a15ba701207f7639d94106693b6cd64173d6c8988e2c25f3ac2b6"
PKG_LICENSE="MIT"
PKG_SITE="https://cffi.readthedocs.io/"
PKG_URL="https://files.pythonhosted.org/packages/source/${PKG_NAME:0:1}/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_HOST="Python3:host setuptools:host"
PKG_LONGDESC="Foreign Function Interface for Python calling C code"
PKG_TOOLCHAIN="manual"

makeinstall_host() {
  exec_thread_safe python setup.py install --prefix=${TOOLCHAIN}
}
