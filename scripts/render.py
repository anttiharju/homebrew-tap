#!/usr/bin/env python3

from helpers import FormulaConfig, render_formula

config = FormulaConfig(
    app_name="vmatch-golangci-lint",
    description="Wrapper that automatically calls the golangci-lint version matching your project",
    homepage="https://anttiharju.dev/vmatch/",
    url="https://github.com/anttiharju/vmatch/archive/refs/tags/build5.tar.gz",
    go_version="1.23",
)

render_formula(config, "go-formula-template")
