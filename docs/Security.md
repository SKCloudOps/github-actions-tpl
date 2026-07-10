# Security

## Core Principles

- GitHub OIDC only for cloud authentication.
- Least privilege everywhere.
- Signed container images for deployable artifacts.
- Fail fast on critical vulnerabilities and secret leaks.
- Require approvals for production promotion.

## Required Controls

- Branch protection on the default branch.
- Environment protection for `development`, `qa`, `uat`, and `production`.
- Artifact retention and SARIF upload for security visibility.
- Regular review of workflow permissions.
- Explicit allowlists for deployment destinations.

