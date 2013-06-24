INSTALL_PATH    ?= $$HOME
OH_MY_ZSH_REPO  ?= https://github.com/robbyrussell/oh-my-zsh.git
RBENV_REPO      ?= https://github.com/sstephenson/rbenv.git
RUBY_BUILD_REPO ?= https://github.com/sstephenson/ruby-build.git
VUNDLE_REPO     ?= https://github.com/gmarik/vundle.git
EXCLUDES        ?= ./.git ./.files.png ./Makefile ./README.markdown

TAR_CMD   = tar `echo $(EXCLUDES) | tr ' ' '\n' | awk '{print "--exclude " $$0}'` --create `find .`
UNTAR_CMD = tar --extract --preserve-permissions --verbose --directory=$(INSTALL_PATH)

install: install-dotfiles install-oh-my-zsh install-rbenv install-ruby-build install-vim-bundles

install-dotfiles:
	@(${TAR_CMD} | ${UNTAR_CMD})

install-oh-my-zsh:
	@(cd ${INSTALL_PATH} ; [ -d .oh-my-zsh ] || git clone ${OH_MY_ZSH_REPO} .oh-my-zsh)

install-rbenv:
	@(cd ${INSTALL_PATH} ; [ -d .rbenv ] || git clone ${RBENV_REPO} .rbenv)

install-ruby-build:
	@(cd ${INSTALL_PATH} ; [ -d .rbenv/plugins/ruby-build ] || git clone ${RUBY_BUILD_REPO} .rbenv/plugins/ruby-build)

install-vundle:
	@(cd ${INSTALL_PATH} ; [ -d .vim/bundle/vundle ] || git clone ${VUNDLE_REPO} .vim/bundle/vundle)

install-vim-bundles: install-vundle
	@vim +BundleClean! +BundleInstall! +qall

.PHONY: install install-dotfiles install-oh-my-zsh install-vundle install-rbenv install-ruby-build install-vim-bundles
