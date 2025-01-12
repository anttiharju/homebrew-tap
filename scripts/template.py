#!/usr/bin/env python3

# actual inputs
app_name = "vmatch-golangci-lint"
description = "Wrapper that automatically calls the golangci-lint version matching your project"
homepage = "https://anttiharju.dev/vmatch/"
url = "https://github.com/anttiharju/vmatch/archive/refs/tags/build5.tar.gz"
go_version = "1.23"

# setup
from pathlib import Path
import subprocess
import tempfile
import os
import re

def calculate_sha256(url: str) -> str:
  with tempfile.NamedTemporaryFile() as tmp:
    subprocess.run(['curl', '-L', '-o', tmp.name, url], check=True)
    result = subprocess.run(['shasum', '-a', '256', tmp.name], capture_output=True, text=True, check=True)
    return result.stdout.split()[0]

def to_pascal_case(kebab_str: str) -> str:
  return ''.join(word.capitalize() for word in kebab_str.split('-'))

def extract_repo(url: str) -> str:
    match = re.search(r'(github\.com/[^/]+/[^/]+)/', url)
    if match:
        return match.group(1)
    raise ValueError("Could not extract repo from GitHub URL")

def extract_version(url: str) -> str:
    match = re.search(r'/tags/([^/]+)\.tar\.gz$', url)
    if match:
        return match.group(1)
    raise ValueError("Could not extract version from URL")

script_dir = Path(__file__).parent
template_path = script_dir / "go-formula-template"

# programmatic inputs
class_name = to_pascal_case(app_name)
sha256 = calculate_sha256(url)
repo = extract_repo(url)
version = extract_version(url)

# templating
replacements = {
  "CLASS_NAME": class_name,
  "DESCRIPTION": description,
  "HOMEPAGE": homepage,
  "URL": url,
  "SHA256": sha256,
  "REPO": repo,
  "GO_VERSION": go_version,
  "APP_NAME": app_name,
  "VERSION": version
}

template = template_path.read_text()
for key, value in replacements.items():
    template = template.replace(f"${key}", value)

formula_dir = script_dir.parent / "Formula"
formula_dir.mkdir(exist_ok=True)
(formula_dir / f"{replacements['APP_NAME']}.rb").write_text(template)
