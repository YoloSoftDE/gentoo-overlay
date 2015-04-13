# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="A learning dmenu wrapper with a stupid simple plugin interface"
HOMEPAGE="https://github.com/AlxHnr/Dlaunch"
#SRC_URI=""
EGIT_REPO_URI="git://github.com/AlxHnr/Dlaunch.git"


LICENSE="zlib"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-scheme/chicken
	x11-misc/dmenu"
RDEPEND="${DEPEND}"


src_compile() {
	emake INSTALL_PREFIX=${ROOT}/usr 
}

src_install() {
	emake INSTALL_PREFIX=${D}/usr install
}

