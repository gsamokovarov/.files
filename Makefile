INSTALL_TARGET ?= $$HOME
OH_MY_ZSH_REPO ?= https://github.com/robbyrussell/oh-my-zsh.git
COLORS_REPO    ?= https://github.com/sigurdga/gnome-terminal-colors-solarized.git
EXCLUDES       ?= ./.git ./.gitmodules ./.files.png ./Makefile ./README.markdown .*.sw?

TAR_CMD   = tar `echo $(EXCLUDES) | tr ' ' '\n' | awk '{print "--exclude " $$0}'` --create `find .`
UNTAR_CMD = tar --extract --preserve-permissions --verbose --directory=$(INSTALL_TARGET)

install: install-dotfiles install-oh-my-zsh install-colors install-vim-bundles

install-dotfiles:
	@(${TAR_CMD} | ${UNTAR_CMD})

install-colors:
	@(cd ${INSTALL_TARGET} ; [ -d .colors ] || git clone ${COLORS_REPO} .colors)
	@${INSTALL_TARGET}/.colors/set_light.sh

install-oh-my-zsh:
	@(cd ${INSTALL_TARGET} ; [ -d .oh-my-zsh ] || git clone ${OH_MY_ZSH_REPO} .oh-my-zsh)

install-vim-bundles:
	@vim +BundleInstall +qall

.PHONY: install install-dotfiles install-colors install-oh-my-zsh install-vim-bundles
