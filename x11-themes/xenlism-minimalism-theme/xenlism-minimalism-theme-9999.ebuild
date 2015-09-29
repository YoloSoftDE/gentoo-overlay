# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit git-r3

DESCRIPTION="Xenlism WildFire is a mixed minimalism and realism gnome-shell/gtk theme inspired by ElementaryOS"
HOMEPAGE="http://xenlism.github.io/minimalism/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/xenlism/minimalism.git"


KEYWORDS=""

LICENSE="GPL-3"
SLOT="0"

IUSE=""

DEPEND="x11-themes/gtk-engines-murrine
		x11-libs/gdk-pixbuf"



RDEPEND="${DEPEND}"


src_install() {
	insinto /usr/share/themes
	doins -r themes/Xenlism-Minimalism
}
