PREFIX ?= $(HOME)/.local
BIN_DIR := $(PREFIX)/bin
BASH_COMPLETION_DIR := $(PREFIX)/share/bash-completion/completions
ZSH_COMPLETION_DIR := $(PREFIX)/share/zsh/site-functions
TEMPLATE_DIR := $(PREFIX)/share/devcontainer-base/templates

BIN_SRC := bin/devcontainer-base
BASH_COMPLETION_SRC := completions/devcontainer-base.bash
ZSH_COMPLETION_SRC := completions/_devcontainer-base

BIN_DEST := $(BIN_DIR)/devcontainer-base
BASH_COMPLETION_DEST := $(BASH_COMPLETION_DIR)/devcontainer-base
ZSH_COMPLETION_DEST := $(ZSH_COMPLETION_DIR)/_devcontainer-base

.PHONY: help install update uninstall

help:
	@printf '%s\n' \
		'Available targets:' \
		'  make help       Show this help' \
		'  make install    Install CLI, completions, and templates into ~/.local' \
		'  make update     Reinstall CLI, completions, and templates into ~/.local' \
		'  make uninstall  Remove installed CLI, completions, and templates from ~/.local'

install:
	mkdir -p "$(BIN_DIR)" "$(BASH_COMPLETION_DIR)" "$(ZSH_COMPLETION_DIR)" "$(TEMPLATE_DIR)"
	install -m 0755 "$(BIN_SRC)" "$(BIN_DEST)"
	install -m 0644 "$(BASH_COMPLETION_SRC)" "$(BASH_COMPLETION_DEST)"
	install -m 0644 "$(ZSH_COMPLETION_SRC)" "$(ZSH_COMPLETION_DEST)"
	find . -mindepth 1 -maxdepth 1 -type d ! -name '.git' ! -name 'bin' ! -name 'completions' | while read -r dir; do \
		if [ -f "$$dir/.devcontainer/devcontainer.json" ]; then \
			rm -rf "$(TEMPLATE_DIR)/$$dir"; \
			cp -R "$$dir" "$(TEMPLATE_DIR)/"; \
		fi; \
	done

update: install

uninstall:
	rm -f "$(BIN_DEST)" "$(BASH_COMPLETION_DEST)" "$(ZSH_COMPLETION_DEST)"
	rm -rf "$(TEMPLATE_DIR)"
