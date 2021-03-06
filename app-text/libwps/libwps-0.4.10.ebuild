# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Microsoft Works file word processor format import filter library"
HOMEPAGE="https://sourceforge.net/p/libwps/wiki/Home/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.xz"

LICENSE="|| ( LGPL-2.1 MPL-2.0 )"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm arm64 ~ppc64 x86"
IUSE="doc debug static-libs tools"

RDEPEND="
	dev-libs/librevenge
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/pkgconfig
	doc? ( app-doc/doxygen )
"

src_configure() {
	econf \
		$(use_enable debug) \
		$(use_with doc docs) \
		$(use_enable static-libs static) \
		$(use_enable tools)
}

src_install() {
	default
	find "${D}" -name '*.la' -delete || die
}
