#!/usr/bin/env python3

import os
from helpers import GoFormulaConfig, render_formula

config = GoFormulaConfig(
    app_name=os.environ["APP_NAME"],
    description=os.environ["DESCRIPTION"],
    homepage=os.environ["HOMEPAGE"],
    url=os.environ["URL"],
    go_version=os.environ["GO_VERSION"],
)

render_formula(config)
