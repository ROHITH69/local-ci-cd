#!/bin/bash

set -euo pipefail

mkdir -p reports

echo "===== Running Tests ====="

pytest tests/ \
--junitxml=reports/pytest-report.xml \
--cov=app \
--cov-report=term \
--cov-report=html:reports/coverage-html \
--cov-report=xml:reports/coverage.xml

echo "===== Tests Completed ====="