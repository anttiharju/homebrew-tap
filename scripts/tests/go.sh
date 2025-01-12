#!/usr/bin/env sh

export TEMPLATE="Go"
export APP_NAME="vmatch-golangci-lint"
export DESCRIPTION="Wrapper that automatically calls the golangci-lint version matching your project"
export HOMEPAGE="https://anttiharju.dev/vmatch"
export URL="https://github.com/anttiharju/vmatch/archive/refs/tags/build6.tar.gz"
export GO_VERSION="1.23"

./scripts/render.py