DEBIAN_BUILD_DIRS := debian-pkg/debian

NO_ARCHIVE := 1

ifneq ($(filter $(DISTRIBUTION), debian),)
SOURCE_COPY_IN := source-debian-copy-in
endif

source-debian-copy-in: VERSION = $(shell cat $(ORIG_SRC)/version)
source-debian-copy-in: ORIG_FILE = $(CHROOT_DIR)/$(DIST_SRC)/modulemd1_$(VERSION).orig.tar.xz
source-debian-copy-in: SRC_FILE  = $(ORIG_SRC)/modulemd-$(VERSION).tar.xz
source-debian-copy-in:
	cp -p $(SRC_FILE) $(ORIG_FILE)
	tar xvf $(SRC_FILE) -C $(CHROOT_DIR)/$(DIST_SRC)/debian-pkg --strip-components=1

# vim: ft=make
