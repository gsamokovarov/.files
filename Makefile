INSTALL_TARGET ?= $$HOME
OH_MY_ZSH_REPO ?= https://github.com/robbyrussell/oh-my-zsh.git
EXCLUDES       ?= `echo './.git ./.gitmodules ./.files.png ./Makefile ./README.markdown' | tr ' ' '\n' | awk '{print "--exclude " $$0}'`

TAR_CMD   = tar $(EXCLUDES) --create `find .`
UNTAR_CMD = tar --extract --preserve-permissions --verbose --directory=$(INSTALL_TARGET)

install: install-dotfiles install-oh-my-zsh install-vim-bundles

install-dotfiles:
	${TAR_CMD} | ${UNTAR_CMD}

install-oh-my-zsh:
	@(cd ${INSTALL_TARGET} ; [ -d .oh-my-zsh ] || git clone ${OH_MY_ZSH_REPO} .oh-my-zsh)

install-vim-bundles:
	@vim -c 'BundleInstall' -c 'qa!'

.PHONY: install install-oh-my-zsh
