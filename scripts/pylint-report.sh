#!/bin/bash

mkdir -p reports

pylint app/app.py > reports/pylint-report.txt