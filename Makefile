INSTALL_TARGET ?= ~
EXCLUDE_FILE    = .excludes

TAR_CMD   = tar --exclude-from=$(EXCLUDE_FILE) --create `find .` 
UNTAR_CMD = tar --extract --preserve-permissions --directory=$(INSTALL_TARGET)

install:
	@${TAR_CMD} | ${UNTAR_CMD}

.PHONY: tar
