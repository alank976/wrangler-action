#!/bin/sh

set -e

export HOME="/github/workspace"
export NVM_DIR="/github/workspace/nvm"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v$NVM_VERSION/install.sh | bash -x
# Comments beginning with "shellcheck" use shellcheck, a shell script linter.
# The below comments ignore shellcheck linting on the instructions provided
# by NVM.

# shellcheck source=/dev/null
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# shellcheck source=/dev/null
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# FIXME: pending to fix: https://github.com/rustwasm/wasm-pack/issues/782
cargo install wasm-pack --version 0.8.1
