#	$NetBSD: Makefile,v 1.9 2009/04/14 22:15:20 lukem Exp $

CFLAGS += -Wall

COMPAT_HDRS := -isystem ${.CURDIR}/include -D__dead=

LIBBSD_CFLAGS != pkg-config libbsd-overlay --cflags
LIBBSD_LIBS != pkg-config libbsd-overlay --libs

CFLAGS += ${LIBBSD_CFLAGS} ${COMPAT_HDRS}
LDFLAGS += ${LIBBSD_LIBS}

PROG=	gencat
MAN=	gencat.1

# don't try to setup ownership; allow unprivileged installation for staging
BINOWN=
MANOWN=
.include <bsd.prog.mk>
