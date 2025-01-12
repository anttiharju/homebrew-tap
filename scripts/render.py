#!/usr/bin/env python3

from helpers import GoFormulaConfig, render_formula

config = GoFormulaConfig(
    name="vmatch-golangci-lint",
    description="Wrapper that automatically calls the golangci-lint version matching your project",
    homepage="https://anttiharju.dev/vmatch",
    url="https://github.com/anttiharju/vmatch/archive/refs/tags/build6.tar.gz",
    go="1.23",
)

render_formula(config)
