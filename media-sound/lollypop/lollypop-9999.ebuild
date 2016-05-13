# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# Set Python-compat
PYTHON_COMPAT=( python3_{3,4,5} )

inherit python-r1 autotools gnome2-utils git-r3

DESCRIPTION="Lollypop is a new GNOME music playing application"
HOMEPAGE="https://github.com/gnumdk/lollypop"
SRC_URI=""
EGIT_REPO_URI="https://github.com/gnumdk/lollypop.git"

LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# No useflags, sadly
IUSE=""

# https://github.com/gnumdk/lollypop#depends-on
#    gtk3
#    gobject-introspection
#    gir1.2-gstreamer-1.0 (Debian)
#    python3
#    intltool (make)
#    itstool (make)
#    totem-plparser
#    python (make)
#    python-cairo
#    python-dbus
#    python-gobject
#    python-sqlite
#    python-pylast >= 1.0

DEPEND="
	${PYTHON_DEPS}
	x11-libs/gtk+:3
	dev-libs/gobject-introspection[cairo]
	dev-util/intltool
	dev-util/itstool
	dev-libs/totem-pl-parser
	dev-python/pycairo
	dev-python/dbus-python
	dev-python/pygobject:3[${PYTHON_USEDEP}]
	gnome-base/gnome-common"

RDEPEND="${DEPEND}
	dev-util/desktop-file-utils
	>=dev-python/pylast-1.0.0[${PYTHON_USEDEP}]"

PYTHON_REQ_USE="sqlite"

src_prepare(){
	eautoreconf
}

src_configure(){
	econf --disable-schemas-compile
}

pkg_preinst(){
	gnome2_schemas_savelist
}

pkg_postrm(){
	
	ewarn 
	ewarn "lollpyop stores its local files in"
	ewarn "		~/.local/share/lollypop/"
	ewarn
	ewarn "If you are upgrading or downgrading and encounter any problems,"
	ewarn "try to remove these files first."
	ewarn 
	ewarn "If you are removing lollypop completely from your system, "
	ewarn "you might want to remove these files, too."
	ewarn
	
	gnome2_gconf_uninstall
	gnome2_schemas_update
}
