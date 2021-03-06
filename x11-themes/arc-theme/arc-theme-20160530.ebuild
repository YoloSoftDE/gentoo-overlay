# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


## --disable-transparency     disable transparency in the GTK3 theme (x)
## --disable-light            disable Arc Light support
## --disable-darker           disable Arc Darker support
## --disable-dark             disable Arc Dark support
## --disable-cinnamon         disable Cinnamon support 
## --disable-gnome-shell      disable GNOME Shell support (x)
## --disable-gtk2             disable GTK2 support (x)
## --disable-gtk3             disable GTK3 support (x)
## --disable-metacity         disable Metacity support (x)
## --disable-unity            disable Unity support (x)
## --disable-xfwm             disable XFWM support (x)
##
## --with-gnome=<version>     build the theme for a specific Gnome version (3.14, 3.16, 3.18)
##                            Note: Normally the correct version is detected automatically and this
##                            option should not be needed.

EAPI=5

inherit eutils autotools versionator

DESCRIPTION="A flat theme with transparent elements for GTK 3, GTK2 and GNOME Shell"
HOMEPAGE="https://github.com/horst3180/arc-theme"
SRC_URI="https://github.com/horst3180/arc-theme/archive/${PV}.tar.gz"


LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS=""


IUSE="gnome-shell +gtk2 gtk3 metacity unity xfwm transparency"
REQUIRED_USE="|| ( gtk2 gtk3 )
	transparency? ( gtk3 )"

DEPEND="x11-themes/gtk-engines-murrine
		x11-libs/gdk-pixbuf"


RDEPEND="${DEPEND}
		gtk2? ( x11-libs/gtk+:2 )
		gtk3? ( x11-libs/gtk+:3 )
		gnome-shell? ( gnome-base/gnome-shell )
		metacity? (
			|| (
				x11-wm/metacity
				x11-wm/marco
				)
		)
		xfwm? ( xfce-base/xfwm4 )"

src_prepare(){
	cd ${P}

	eautoreconf
}

src_configure(){
	cd ${P}

	local myconf=''
	
	use !gtk2 && myconf+="--disable-gtk2 "
	use !gtk3 && myconf+="--disable-gtk3 "
	use !transparency && myconf+="--disable-transparency "

	use !gnome-shell && myconf+="--disable-gnome-shell "
	use !unity && myconf+="--disable-unity "
	use !metacity && myconf+="--disable-metacity "
	use !xfwm && myconf+="--disable-xfwm "
	
	econf ${myconf}
}
