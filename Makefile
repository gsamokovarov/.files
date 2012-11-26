INSTALL_TARGET ?= $$HOME
OH_MY_ZSH_REPO ?= https://github.com/robbyrussell/oh-my-zsh.git
EXCLUDE_FILE    = .excludes

TAR_CMD   = tar --exclude-from=$(EXCLUDE_FILE) --create `find .` 
UNTAR_CMD = tar --extract --preserve-permissions --verbose --directory=$(INSTALL_TARGET)

install: install-oh-my-zsh
	@${TAR_CMD} | ${UNTAR_CMD}

install-oh-my-zsh:
	@(cd ${INSTALL_TARGET} ; [ -d .oh-my-zsh ] || git clone ${OH_MY_ZSH_REPO} .oh-my-zsh)

.PHONY: install install-oh-my-zsh
