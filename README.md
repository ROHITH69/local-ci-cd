# Local CI/CD Platform

## Project Overview

This project demonstrates a complete local CI/CD workflow using:

- Python Flask Application
- Jenkins Pipeline
- Docker
- Trivy Security Scanning
- OPA Policy Validation
- Automated Testing
- Linting
- Automation Scripts

The goal of this project is to simulate an industrial DevSecOps pipeline locally.

---

# Architecture Flow

Developer Pushes Code
        ↓
GitHub Repository
        ↓
Jenkins Pipeline
        ↓
Testing + Linting
        ↓
Docker Build
        ↓
Security Scanning
        ↓
OPA Policy Validation
        ↓
Container Deployment

---

# Project Structure

```text
local-ci-cd/
│
├── app/
├── tests/
├── scripts/
├── policies/
├── reports/
├── Dockerfile
├── Jenkinsfile
├── README.md
```