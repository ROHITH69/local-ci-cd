#!/bin/bash

source config/app.env

mkdir -p reports

echo "Running Trivy security scan..."

trivy image \
  -f json \
  -o reports/trivy-report.json \
  ${IMAGE_NAME}

echo "Security scan completed successfully."