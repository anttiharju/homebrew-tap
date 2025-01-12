#!/usr/bin/env python3

import re
import subprocess
import tempfile
from dataclasses import dataclass
from pathlib import Path
from typing import Dict


@dataclass
class GoFormulaConfig:
    """Configuration for generating a Homebrew formula."""

    name: str
    description: str
    homepage: str
    url: str
    go: str = None

    def __post_init__(self):
        """Convert go version to internal format after initialization."""
        if self.go:
            value = self.go
            self._go = None
            self.go = value

    @property
    def go(self) -> str:
        """Return Go version in x.y format."""
        return self._go

    @go.setter
    def go(self, value: str) -> None:
        """Set Go version, accepting x.y or x.y.z format."""
        if not re.match(r"^\d+\.\d+(?:\.\d+)?$", value):
            raise ValueError("Go version must be in format x.y or x.y.z")
        # Store only major.minor
        self._go = ".".join(value.split(".")[:2])


def calculate_sha256(url: str) -> str:
    """Calculate SHA256 hash of file at given URL."""
    with tempfile.NamedTemporaryFile() as tmp:
        try:
            subprocess.run(
                ["curl", "-L", "-o", tmp.name, url], check=True, capture_output=True
            )
            result = subprocess.run(
                ["shasum", "-a", "256", tmp.name],
                capture_output=True,
                text=True,
                check=True,
            )
            return result.stdout.split()[0]
        except subprocess.CalledProcessError as e:
            raise RuntimeError(f"Failed to calculate SHA256: {e}")


def to_pascal_case(kebab_str: str) -> str:
    """Convert kebab-case string to PascalCase."""
    return "".join(word.capitalize() for word in kebab_str.split("-"))


def extract_repo(url: str) -> str:
    """Extract repository path from GitHub URL."""
    if match := re.search(r"(github\.com/[^/]+/[^/]+)/", url):
        return match.group(1)
    raise ValueError("Could not extract repo from GitHub URL")


def extract_version(url: str) -> str:
    """Extract version from GitHub release URL."""
    if match := re.search(r"/tags/([^/]+)\.tar\.gz$", url):
        return match.group(1)
    raise ValueError("Could not extract version from URL")


def generate_replacements(config: GoFormulaConfig) -> Dict[str, str]:
    """Generate replacement dictionary for template variables."""
    return {
        "CLASS_NAME": to_pascal_case(config.name),
        "DESCRIPTION": config.description,
        "HOMEPAGE": config.homepage,
        "URL": config.url,
        "SHA256": calculate_sha256(config.url),
        "REPO": extract_repo(config.url),
        "GO": config.go,
        "APP_NAME": config.name,
        "VERSION": extract_version(config.url),
    }


def render_formula(config: GoFormulaConfig) -> None:
    """Render a Homebrew formula from a template.

    Args:
        config: Formula configuration
        template_name: Name of the template file to use
    """
    scripts_dir = Path(__file__).parent
    template_path = scripts_dir / "go-formula-template"
    formula_dir = scripts_dir.parent / "Formula"
    formula_dir.mkdir(exist_ok=True)

    replacements = generate_replacements(config)
    template = template_path.read_text()

    for key, value in replacements.items():
        template = template.replace(f"${key}", value)

    (formula_dir / f"{config.name}.rb").write_text(template)
