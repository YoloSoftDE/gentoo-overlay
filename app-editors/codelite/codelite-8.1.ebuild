# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#################################################################################################################################################################
## Optional command line arguments:                                                                                                                             #
##                                                                                                                                                              #
##      -DCMAKE_BUILD_TYPE=Release|Debug|DebugFull // Build release, debug + optimisation or debug without optimisation (for others see the Cmake docs)         #
##      -DPREFIX="<some-prefix>"                   // Installation prefix, default is set to /usr                                                               #
##      -DENABLE_CLANG=1|0                         // Build codelite with clang code completion support?, default is 1 (with clang)                             #
##      -DWITH_WXC=1|0                             // Build wxCrafter (sources are not part of codelite distribution) default is 0                              #
##      -DCOPY_WX_LIBS=1|0                         // Incorporate the wxWidgets libs into CodeLite so the binary doesn't depend on them. default is 0           #
##      -DPREVENT_WX_ASSERTS=1|0                   // Prevent those annoying wxASSERTS. In release builds the default is 1, in debug 0                          #
##      -DAUTOGEN_REVISION=1|0                     // Should cmake generate makefiles that auto generates the autoversion.cpp file - default is 1               #
##      -DWITH_PCH=1|0                             // Enable Pre Compiled Header?                                                                               #
##      -DGTK_USE_NATIVEBOOK=1|0                   // Under GTK, use the native notebook instead of wxAuiNoteook. Default is set to 0                           #
##      -DWITH_WXPATH=<fullpath>                   // Specify a particular wxWidgets build to use. The format must be /path/to/different_wx-config/directory/   #
##      -DMAKE_DEB=1|0                             // When set to 1, you can use make package to create .deb file for codelite                                  #
##      -DENABLE_SFTP=1|0                          // When set to 1 codelite is built with SFTP support. Default is build _with_ SFTP support                   #
##      -DENABLE_LLDB=1|0                          // When set to 0 codelite won't try to build or link to the lldb debugger. Default is 1 on Unix platforms    #
#################################################################################################################################################################

EAPI=5

inherit git-r3

DESCRIPTION="CodeLite, a cross platform C/C++/PHP IDE written in C++."
HOMEPAGE="http://codelite.org"
EGIT_REPO_URI="https://github.com/eranif/codelite.git"
EGIT_COMMIT="8.1"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="+clang -gtk_notebook +sftp +lldb"

DEPEND=">=x11-libs/wxGTK-3.0.0.0
  sftp? ( net-libs/libssh )"

src_configure() {
  mkdir build-release
  cd build-release

  # Build codelite with clang code completion support?, default is 1 (with clang)
  if use clang ; then
    myconf = "${myconf} -DENABLE_CLANG=1"
  else
    myconf = "${myconf} -DENABLE_CLANG=0"
  fi

  # Under GTK, use the native notebook instead of wxAuiNoteook. Default is set to 0 
  if use gtk_notebook ; then
    myconf = "${myconf} -DGTK_USE_NATIVEBOOK=1"
  else
    myconf = "${myconf} -DGTK_USE_NATIVEBOOK=0"
  fi

  # When set to 1 codelite is built with SFTP support. Default is build _with_ SFTP support
  if use sftp ; then
    myconf = "${myconf} -DENABLE_SFTP=1"
  else
    myconf = "${myconf} -DENABLE_SFTP=0"
  fi

  # When set to 0 codelite won't try to build or link to the lldb debugger. Default is 1 on Unix platforms
  if use lldb ; then
    myconf = "${myconf} -DENABLE_LLDB=1"
  else
    myconf = "${myconf} -DENABLE_LLDB=0"
  fi

  cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release ${myconf} -DPREFIX="${D}/usr/" ..
}

src_compile() {
  cd build-release
  emake
}

src_install() {
  cd build-release
  emake install
}

