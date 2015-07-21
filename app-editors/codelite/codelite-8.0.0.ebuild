# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="CodeLite, a cross platform C/C++/PHP IDE written in C++."
HOMEPAGE="http://codelite.org"
EGIT_REPO_URI="https://github.com/eranif/codelite.git"
EGIT_COMMIT="8.0-1"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=x11-libs/wxGTK-3.0.0.0
  net-libs/libssh"

src_install() {
  cd codelite
  mkdir build-release
  cd build-release
  cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release ..
  make -j4
  sudo make install
}

