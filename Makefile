INSTALL_PATH    ?= $$HOME
OH_MY_ZSH_REPO  ?= https://github.com/robbyrussell/oh-my-zsh.git
RBENV_REPO      ?= https://github.com/sstephenson/rbenv.git
RUBY_BUILD_REPO ?= https://github.com/sstephenson/ruby-build.git
VUNDLE_REPO     ?= https://github.com/gmarik/vundle.git
EXCLUDES        ?= ./.git ./.files.png ./Makefile ./README.markdown

TAR_CMD   = tar `echo $(EXCLUDES) | tr ' ' '\n' | awk '{print "--exclude " $$0}'` --create `find .`
UNTAR_CMD = tar --extract --preserve-permissions --verbose --directory=$(INSTALL_PATH)

clone-git-repo-if-not-exist = \
	@(cd ${INSTALL_PATH} ; [ -d $(2) ] || git clone $(1) $(2))

install: install-dotfiles install-oh-my-zsh install-rbenv install-ruby-build install-vim-bundles

install-dotfiles:
	@(${TAR_CMD} | ${UNTAR_CMD})

install-oh-my-zsh:
	$(call clone-git-repo-if-not-exist,${OH_MY_ZSH_REPO},.oh-my-zsh)

install-rbenv:
	$(call clone-git-repo-if-not-exist,${RBENV_REPO},.rbenv)

install-ruby-build:
	$(call clone-git-repo-if-not-exist,${RUBY_BUILD_REPO},.rbenv/plugins/ruby-build)

install-vundle:
	$(call clone-git-repo-if-not-exist,${VUNDLE_REPO},.vim/bundle/vundle)

install-vim-bundles: install-vundle
	@vim +BundleClean! +BundleInstall! +qall

.PHONY: install install-dotfiles install-oh-my-zsh install-vundle install-rbenv install-ruby-build install-vim-bundles
