#!/usr/bin/env bash

set -eu

workspace_dir=$(pwd)

if ! git config --global --get-all safe.directory | grep -Fx -- "$workspace_dir" >/dev/null 2>&1; then
  git config --global --add safe.directory "$workspace_dir"
fi
