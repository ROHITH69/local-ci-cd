#!/bin/bash

flake8 .

pylint app/app.py --fail-under=8