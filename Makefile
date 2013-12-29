INSTALL_PATH    ?= $$HOME
OH_MY_ZSH_REPO  ?= https://github.com/robbyrussell/oh-my-zsh.git
RBENV_REPO      ?= https://github.com/sstephenson/rbenv.git
RUBY_BUILD_REPO ?= https://github.com/sstephenson/ruby-build.git
NEOBUNDLE_REPO  ?= https://github.com/Shougo/neobundle.vim.git
EXCLUDES        ?= ./.git ./.files.png ./Makefile ./README.markdown

TAR_CMD   = find . -print0 | xargs -0 tar `echo $(EXCLUDES) | tr ' ' '\n' | awk '{print "--exclude " $$0}'` --create
UNTAR_CMD = tar --extract --preserve-permissions --verbose --directory=$(INSTALL_PATH)

clone-git-repo-if-not-exist = @(cd ${INSTALL_PATH} ; [ -d $(2) ] || git clone $(1) $(2))

install: install-dotfiles install-oh-my-zsh install-rbenv install-ruby-build install-vim-bundles

install-dotfiles:
	@(${TAR_CMD} | ${UNTAR_CMD})

install-oh-my-zsh:
	$(call clone-git-repo-if-not-exist,${OH_MY_ZSH_REPO},.oh-my-zsh)

install-rbenv:
	$(call clone-git-repo-if-not-exist,${RBENV_REPO},.rbenv)

install-ruby-build:
	$(call clone-git-repo-if-not-exist,${RUBY_BUILD_REPO},.rbenv/plugins/ruby-build)

install-neobundle:
	$(call clone-git-repo-if-not-exist,${NEOBUNDLE_REPO},.vim/bundle/neobundle.vim)

install-vim-bundles: install-neobundle
	@vim +"silent NeoBundleClean!" +"silent NeoBundleInstall!" +qall!

.PHONY: install install-dotfiles install-oh-my-zsh install-neobundle install-rbenv install-ruby-build install-vim-bundles
