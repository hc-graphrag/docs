#!/usr/bin/env bash
set -euo pipefail
repo_root=$(git rev-parse --show-toplevel)
git -C "$repo_root" config --local core.hooksPath .githooks
printf 'Enabled the repository pre-commit security hook.\n'
