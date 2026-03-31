PREFIX ?= /usr/local
LOCAL_PREFIX := $(HOME)/.local/bin

all:
	@echo To install efinder system wide run:
	@echo \'make install\' as root
	@echo
	@echo To install efinder in $(HOME)/.local/bin run:
	@echo \'make install-local\' as the target user.
	@echo

.PHONY: install uninstall install-local uninstall-local
.PHONY: 
install:
	@mkdir -p $(DESTDIR)$(PREFIX)/bin/
	@echo installing efinder to $(DESTDIR)$(PREFIX)/bin/...
	@install -m 0755 efinder $(DESTDIR)$(PREFIX)/bin/
	@echo Installation successful.

uninstall:
	@ echo Removing /usr/local/bin/efinder...
	@rm -f $(PREFIX)/bin/efinder
	@echo efinder uninstalled.

install-local:
	@mkdir -p $(LOCAL_PREFIX)
	@echo installing efinder to $(LOCAL_PREFIX)...
	@install -m 0755 efinder $(LOCAL_PREFIX)/
	@echo Installation successful.

uninstall-local:
	@ echo Removing $(LOCAL_PREFIX)/efinder...
	@rm -f $(LOCAL_PREFIX)/efinder
	@echo efinder uninstalled.
