#!/bin/bash

SCRIPT_DIR=$(dirname "$0")

cat "$SCRIPT_DIR"/go-formula-template | \
sed "s/\$CLASS_NAME/VmatchGolangciLint/g" | \
sed "s/\$DESCRIPTION/Wrapper that automatically calls the golangci-lint version matching your project/g" | \
sed "s|\$HOMEPAGE|https://anttiharju.dev/vmatch/|g" | \
sed "s|\$URL|https://github.com/anttiharju/vmatch/archive/refs/tags/build5.tar.gz|g" | \
sed "s/\$SHA256/33d87b5789ecd5920e746ce0e8762ef09f8be4d746c6d319801c74f593d7f6ce/g" | \
sed "s|\$REPO|github.com/anttiharju/vmatch|g" | \
sed "s/\$GO_VERSION/1.23/g" | \
sed "s/\$APP_NAME/vmatch-golangci-lint/g" | \
sed "s/\$VERSION/build5/g" \
> Formula/vmatch-golangci-lint.rb
