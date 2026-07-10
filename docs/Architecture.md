# Architecture

This repository defines a reusable GitHub Enterprise delivery framework.

## Layers

### 1. Application Layer

Java Spring Boot, React, and future Node.js, Python, and .NET workloads consume the same platform patterns.

### 2. Workflow Layer

Reusable workflows provide the orchestration primitives:

- build
- security
- docker
- ECR login
- deployment
- ArgoCD synchronization
- notifications

### 3. Action Layer

Composite actions isolate vendor-specific and tool-specific behavior:

- Sonar
- Checkmarx
- Trivy
- Syft
- Cosign
- Slack
- Teams

### 4. Script Layer

Shell scripts standardize operational tasks such as build, deploy, rollback, smoke test, and GitOps manifest updates.

### 5. Delivery Layer

The delivery path uses AWS OIDC, ECR, EKS, Helm, and ArgoCD.

## Control Objectives

- Repeatable pipeline behavior across repositories.
- Strong separation of build and deploy concerns.
- Environment approvals before production promotion.
- Signed images and traceable GitOps changes.
- Security gates integrated into the delivery path.

