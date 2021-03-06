# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DIST_AUTHOR=GRUBER
DIST_VERSION=1.22
inherit perl-module toolchain-funcs

DESCRIPTION="Patricia Trie perl module for fast IP address lookups"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 sparc x86 ~x86-fbsd"
IUSE="ipv6"

RDEPEND="dev-perl/Net-CIDR-Lite
	ipv6? (
		dev-perl/Socket6
	)
"
DEPEND="${RDEPEND}"

PATCHES=("${FILESDIR}/${PN}-1.22-no-lnsl.patch")
src_compile() {
	emake AR="$(tc-getAR)" OTHERLDFLAGS="${LDFLAGS}"
}
