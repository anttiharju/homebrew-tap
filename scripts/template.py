#!/usr/bin/env python3

# actual inputs
app_name = "vmatch-golangci-lint"
description = "Wrapper that automatically calls the golangci-lint version matching your project"
homepage = "https://anttiharju.dev/vmatch/"
url = "https://github.com/anttiharju/vmatch/archive/refs/tags/build5.tar.gz"
repo = "github.com/anttiharju/vmatch"
go_version = "1.23"

# setup
from pathlib import Path

def to_pascal_case(kebab_str: str) -> str:
  return ''.join(word.capitalize() for word in kebab_str.split('-'))

script_dir = Path(__file__).parent
template_path = script_dir / "go-formula-template"

# programmatic inputs
class_name = to_pascal_case(app_name)

# templating
replacements = {
  "CLASS_NAME": class_name,
  "DESCRIPTION": description,
  "HOMEPAGE": homepage,
  "URL": url,
  "SHA256": "33d87b5789ecd5920e746ce0e8762ef09f8be4d746c6d319801c74f593d7f6ce",
  "REPO": repo,
  "GO_VERSION": go_version,
  "APP_NAME": app_name,
  "VERSION": "build5"
}

template = template_path.read_text()
for key, value in replacements.items():
    template = template.replace(f"${key}", value)

formula_dir = script_dir.parent / "Formula"
formula_dir.mkdir(exist_ok=True)
(formula_dir / f"{replacements['APP_NAME']}.rb").write_text(template)
