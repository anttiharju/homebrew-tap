#!/usr/bin/env python3

from pathlib import Path

script_dir = Path(__file__).parent
template_path = script_dir / "go-formula-template"

replacements = {
  "CLASS_NAME": "VmatchGolangciLint",
  "DESCRIPTION": "Wrapper that automatically calls the golangci-lint version matching your project",
  "HOMEPAGE": "https://anttiharju.dev/vmatch/",
  "URL": "https://github.com/anttiharju/vmatch/archive/refs/tags/build5.tar.gz",
  "SHA256": "33d87b5789ecd5920e746ce0e8762ef09f8be4d746c6d319801c74f593d7f6ce",
  "REPO": "github.com/anttiharju/vmatch",
  "GO_VERSION": "1.23",
  "APP_NAME": "vmatch-golangci-lint",
  "VERSION": "build5"
}

template = template_path.read_text()
for key, value in replacements.items():
    template = template.replace(f"${key}", value)

formula_dir = script_dir.parent / "Formula"
formula_dir.mkdir(exist_ok=True)
(formula_dir / f"{replacements['APP_NAME']}.rb").write_text(template)
