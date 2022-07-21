INSTALL_PATH ?= $$HOME
EXCLUDES     ?= ./.git ./.files.png ./Makefile ./README.markdown
TAR_CMD       = find . -print0 | xargs -0 tar `echo $(EXCLUDES) | tr ' ' '\n' | awk '{print "--exclude " $$0}'` --create
UNTAR_CMD     = tar --extract --preserve-permissions --verbose --directory=$(INSTALL_PATH)

install: install-dotfiles install-nvimrc

install-dotfiles:
	@(${TAR_CMD} | ${UNTAR_CMD})

install-nvimrc:
	@ln -nsf ${INSTALL_PATH}/.vim ${INSTALL_PATH}/.config/nvim
	@ln -nsf ${INSTALL_PATH}/.vimrc ${INSTALL_PATH}/.config/nvim/init.vim

.PHONY: install install-dotfiles
