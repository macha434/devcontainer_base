PREFIX ?= $(HOME)/.local
REPO_ROOT := $(abspath .)
HOOKS_DIR := $(REPO_ROOT)/.githooks
BIN_DIR := $(PREFIX)/bin
BASH_COMPLETION_DIR := $(PREFIX)/share/bash-completion/completions
ZSH_COMPLETION_DIR := $(PREFIX)/share/zsh/site-functions
TEMPLATE_DIR := $(PREFIX)/share/devcontainer-base/templates

BIN_SRC := $(REPO_ROOT)/bin/devcontainer-base
BASH_COMPLETION_SRC := $(REPO_ROOT)/completions/devcontainer-base.bash
ZSH_COMPLETION_SRC := $(REPO_ROOT)/completions/_devcontainer-base

BIN_DEST := $(BIN_DIR)/devcontainer-base
BASH_COMPLETION_DEST := $(BASH_COMPLETION_DIR)/devcontainer-base
ZSH_COMPLETION_DEST := $(ZSH_COMPLETION_DIR)/_devcontainer-base

.PHONY: help install update uninstall

help:
	@printf '%s\n' \
		'Available targets:' \
		'  make help       Show this help' \
		'  make install    Symlink CLI, completions, and templates into ~/.local and enable git hooks' \
		'  make update     Refresh CLI, completions, and template symlinks in ~/.local' \
		'  make uninstall  Remove installed CLI, completions, template symlinks, and managed git hooks'

install:
	mkdir -p "$(BIN_DIR)" "$(BASH_COMPLETION_DIR)" "$(ZSH_COMPLETION_DIR)" "$(TEMPLATE_DIR)"
	rm -f "$(BIN_DEST)" "$(BASH_COMPLETION_DEST)" "$(ZSH_COMPLETION_DEST)"
	ln -s "$(BIN_SRC)" "$(BIN_DEST)"
	ln -s "$(BASH_COMPLETION_SRC)" "$(BASH_COMPLETION_DEST)"
	ln -s "$(ZSH_COMPLETION_SRC)" "$(ZSH_COMPLETION_DEST)"
	git config --local core.hooksPath "$(HOOKS_DIR)"
	find . -mindepth 1 -maxdepth 1 -type d ! -name '.git' ! -name 'bin' ! -name 'completions' | while read -r dir; do \
		if [ -f "$$dir/.devcontainer/devcontainer.json" ]; then \
			rm -rf "$(TEMPLATE_DIR)/$$dir"; \
			ln -s "$(REPO_ROOT)/$$dir" "$(TEMPLATE_DIR)/$$dir"; \
		fi; \
	done

update: install

uninstall:
	rm -f "$(BIN_DEST)" "$(BASH_COMPLETION_DEST)" "$(ZSH_COMPLETION_DEST)"
	rm -rf "$(TEMPLATE_DIR)"
	if [ "$$(git config --local --get core.hooksPath || true)" = "$(HOOKS_DIR)" ]; then \
		git config --local --unset core.hooksPath; \
	fi
