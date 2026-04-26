#!/usr/bin/env bash
set -euo pipefail

workspace_dir=$(pwd)

git config --global --add safe.directory "$workspace_dir"

command -v node
command -v corepack

export COREPACK_ENABLE_DOWNLOAD_PROMPT=0

corepack enable
corepack prepare pnpm@latest --activate

pnpm --version

pnpm install

pnpm config set --location=project trustPolicy no-downgrade
pnpm config set --location=project --json minimumReleaseAge 10080
pnpm config set --location=project blockExoticSubdeps true
pnpm config set --location=project strictDepBuilds true
pnpm config set --location=project verifyDepsBeforeRun error
pnpm config set --location=project engineStrict true
pnpm config set --location=project packageManagerStrictVersion true

sudo chown -R $(id -u):$(id -g) /mnt/codex-auth
sudo chown -R $(id -u):$(id -g) /mnt/github-auth

mkdir -p /mnt/codex-auth/.codex
mkdir -p "$HOME"
if [ -e "$HOME/.codex" ] && [ ! -L "$HOME/.codex" ]; then
  rm -rf "$HOME/.codex"
fi
ln -snf /mnt/codex-auth/.codex "$HOME/.codex"

mkdir -p /mnt/github-auth/gh
mkdir -p "$HOME/.config"
if [ -e "$HOME/.config/gh" ] && [ ! -L "$HOME/.config/gh" ]; then
  rm -rf "$HOME/.config/gh"
fi
ln -snf /mnt/github-auth/gh "$HOME/.config/gh"
export GH_CONFIG_DIR="${GH_CONFIG_DIR:-/mnt/github-auth/gh}"

git config --global --unset-all credential.helper || true
if command -v gh >/dev/null 2>&1 && gh auth status --hostname github.com >/dev/null 2>&1; then
  gh auth setup-git
fi

git config pull.rebase true

pnpm add -g @openai/codex
