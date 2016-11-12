INSTALL_PATH    ?= $$HOME
RBENV_REPO      ?= https://github.com/sstephenson/rbenv.git
RUBY_BUILD_REPO ?= https://github.com/sstephenson/ruby-build.git
GEM_REHASH_REPO ?= https://github.com/sstephenson/rbenv-gem-rehash.git
EXCLUDES        ?= ./.git ./.files.png ./Makefile ./README.markdown

TAR_CMD   = find . -print0 | xargs -0 tar `echo $(EXCLUDES) | tr ' ' '\n' | awk '{print "--exclude " $$0}'` --create
UNTAR_CMD = tar --extract --preserve-permissions --verbose --directory=$(INSTALL_PATH)

clone-git-repo-unless-exist = @(cd ${INSTALL_PATH} ; [ -d $(2) ] || git clone $(1) $(2))

install: install-dotfiles install-go install-rbenv install-gem-rehash install-ruby-build install-nvimrc

install-dotfiles:
	@(${TAR_CMD} | ${UNTAR_CMD})

install-go:
	@(mkdir -p ~/.go/bin)

install-rbenv:
	$(call clone-git-repo-unless-exist,${RBENV_REPO},.rbenv)
	@(cd ~/.rbenv && src/configure && make -C src 1>/dev/null)

install-ruby-build:
	$(call clone-git-repo-unless-exist,${RUBY_BUILD_REPO},.rbenv/plugins/ruby-build)

install-gem-rehash:
	$(call clone-git-repo-unless-exist,${RUBY_BUILD_REPO},.rbenv/plugins/rbenv-gem-rehash)

install-nvimrc:
	@ln -nsf ${INSTALL_PATH}/.vim ${INSTALL_PATH}/.config/nvim
	@ln -nsf ${INSTALL_PATH}/.vimrc ${INSTALL_PATH}/.config/nvim/init.vim

.PHONY: install install-dotfiles install-rbenv install-ruby-build install-gem-rehash
