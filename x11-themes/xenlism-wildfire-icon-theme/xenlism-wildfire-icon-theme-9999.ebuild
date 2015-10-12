# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit git-r3 gnome2-utils

DESCRIPTION="Xenlism WildFire is a mixed minimalism and realism vector icon theme inspired by Nokia Meego and Apple iOS."
HOMEPAGE="http://xenlism.github.io/wildfire/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/xenlism/wildfire.git"


KEYWORDS=""

LICENSE="GPL-3"
SLOT="0"

IUSE="+wallpaper +icons +icons-day +icons-night +icons-midnight +icons-week"
REQUIRED_USE="|| ( wallpaper icons )
	icons-day? ( icons ) 
	icons-midnight? ( icons )
	icons-night? ( icons )
	icons-week? ( icons )"


DEPEND=""
RDEPEND="${DEPEND}"


src_install() {
	if use wallpaper ; then
		# install wallpapers
		insinto /usr/share/backgrounds/xenlism/
		doins -r wallpapers/*

		# install background properties
		insinto /usr/share/gnome-background-properties/
		doins -r background-properties/*
	fi

	insinto /usr/share/icons

	if use icons ; then
		elog "Installing main theme ..."
		doins -r icons/Xenlism-Wildfire
	fi

	if use icons-day ; then
		elog "Installing day theme ..."
		doins -r icons/Xenlism-Wildfire-Day
	fi

	if use icons-midnight ; then
		elog "Installing midnight theme ..."
		doins -r icons/Xenlism-Wildfire-MidNight
	fi

	if use icons-night ; then
		elog "Installing night theme ..."
		doins -r icons/Xenlism-Wildfire-Night
	fi

	if use icons-week ; then
		elog "Installing weekdays theme ..."
		doins -r icons/Xenlism-Wildfire-MonDay
		doins -r icons/Xenlism-Wildfire-TuesDay
		doins -r icons/Xenlism-Wildfire-WednesDay
		doins -r icons/Xenlism-Wildfire-ThursDay
		doins -r icons/Xenlism-Wildfire-FriDay
		doins -r icons/Xenlism-Wildfire-SaturDay
		doins -r icons/Xenlism-Wildfire-SunDay
	fi
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
