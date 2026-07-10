# Troubleshooting

## Workflow Fails on Credentials

- Verify the IAM role trust policy for GitHub OIDC.
- Confirm the repository, branch, and environment claims match the trust policy.
- Ensure the workflow has `id-token: write` permission.

## Sonar Quality Gate Never Completes

- Confirm the project key matches the SonarQube project.
- Ensure the token has permission to submit analysis.
- Check that the quality gate is configured for the branch being analyzed.

## Trivy or SBOM Scans Fail

- Verify the scan target exists and the image reference is correct.
- Confirm Docker is available if image scans are used.
- Review severity thresholds and ignore files.

## GitOps Update Fails

- Confirm the GitOps repository URL and branch exist.
- Check that the deploy key or token has write access.
- Ensure `yq` or the fallback manifest update method is available.

