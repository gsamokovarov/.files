ifeq ($(shell uname -s),Darwin)
	DETECTED_OS = osx
else
	DETECTED_OS = linux
endif

INSTALL_PATH ?= $$HOME

install: $(DETECTED_OS)

osx:
	@(tar --create --dereference --file=- --directory=osx . | tar --extract --preserve-permissions --verbose --directory=$(INSTALL_PATH))

linux:
	@(tar --create --dereference --file=- --directory=linux . | tar --extract --preserve-permissions --verbose --directory=$(INSTALL_PATH))

.PHONY: install osx linux
