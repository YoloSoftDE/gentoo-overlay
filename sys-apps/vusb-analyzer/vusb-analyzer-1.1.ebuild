# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit python

DESCRIPTION="Graphical tool for browsing traces of captured USB data"
HOMEPAGE="http://vusb-analyzer.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~ppc ~amd64"
IUSE="psyco"

PYTHON_DEPEND="2"

# DEPEND=""
DEPEND="dev-python/libgnomecanvas-python
	dev-python/pygtk
	psyco? ( dev-python/psyco )"

src_install() {
	dobin vusb-analyzer
	dodoc README.txt CHANGELOG.txt
	mkdir -p ${D}/$(python_get_libdir)/site-packages
	cp -r VUsbTools ${D}/$(python_get_libdir)/site-packages/
}

