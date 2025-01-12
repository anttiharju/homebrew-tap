#!/usr/bin/env python3

import os
from helpers import GoFormulaConfig, render_formula

config = GoFormulaConfig(
    name=os.environ["NAME"],
    description=os.environ["DESCRIPTION"],
    homepage=os.environ["HOMEPAGE"],
    url=os.environ["URL"],
    go=os.environ["GO"],
)

render_formula(config)
