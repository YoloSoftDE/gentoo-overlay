# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit git-r3

DESCRIPTION="Xenlism WildFire is a mixed minimalism and realism vector icon theme inspired by Nokia Meego and Apple iOS."
HOMEPAGE="http://xenlism.github.io/wildfire/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/xenlism/wildfire.git"


KEYWORDS=""

LICENSE="CC-BY-NC-ND-4.0"
SLOT="0"

IUSE="+wallpaper +icons-normal +icons-day +icons-night +icons-midnight"
REQUIRED_USE="|| ( wallpaper icons-normal icons-day icons-midnight icons-night )"


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

	if use icons-normal ; then
		doins -r icons/Xenlism-Wildfire
	fi

	if use icons-day ; then
		doins -r icons/Xenlism-Wildfire-Day
	fi

	if use icons-midnight ; then
		doins -r icons/Xenlism-Wildfire-MidNight
	fi

	if use icons-night ; then
		doins -r icons/Xenlism-Wildfire-Night
	fi
}
