ifeq ($(shell uname -s),Darwin)
	DETECTED_OS = osx
else
	DETECTED_OS = linux
endif

INSTALL_PATH ?= $$HOME
SOURCE_DIR   ?= .
TAR_CMD       = find $(SOURCE_DIR) -print0 | xargs -0 tar --create
UNTAR_CMD     = tar --extract --preserve-permissions --verbose --directory=$(INSTALL_PATH)

install: $(DETECTED_OS)

osx: SOURCE_DIR = osx
osx:
	@(${TAR_CMD} | ${UNTAR_CMD})

linux: SOURCE_DIR = linux
linux:
	@(${TAR_CMD} | ${UNTAR_CMD})

.PHONY: install osx linux
