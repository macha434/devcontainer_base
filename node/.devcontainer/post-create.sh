#!/usr/bin/env bash

set -eu

workspace_dir=$(pwd)

if ! git config --global --get-all safe.directory | grep -Fx -- "$workspace_dir" >/dev/null 2>&1; then
  git config --global --add safe.directory "$workspace_dir"
fi

corepack enable
corepack prepare pnpm@latest --activate
pnpm add eslint prettier

pnpm config set --location=project trustPolicy no-downgrade
pnpm config set --location=project --json minimumReleaseAge 10080
pnpm config set --location=project blockExoticSubdeps true
pnpm config set --location=project strictDepBuilds true
pnpm config set --location=project verifyDepsBeforeRun error
pnpm config set --location=project engineStrict true
pnpm config set --location=project packageManagerStrictVersion true

pnpm add -g @openai/codex
