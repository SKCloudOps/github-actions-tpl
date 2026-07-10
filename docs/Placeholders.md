# Placeholders

This repository uses placeholders everywhere so consuming teams can replace values safely.

## Standard Placeholders

- `<AWS_ACCOUNT_ID>`
- `<AWS_REGION>`
- `<AWS_ROLE_ARN>`
- `<AWS_PARTITION>`
- `<ECR_REPOSITORY>`
- `<ECR_IMAGE_URI>`
- `<EKS_CLUSTER_NAME>`
- `<K8S_NAMESPACE>`
- `<S3_BUCKET>`
- `<CLOUDFRONT_DISTRIBUTION_ID>`
- `<HELM_RELEASE_NAME>`
- `<HELM_CHART_PATH>`
- `<GITHUB_ORG>`
- `<GITHUB_REPOSITORY>`
- `<GITOPS_REPOSITORY>`
- `<GITOPS_BRANCH>`
- `<GITOPS_MANIFEST_PATH>`
- `<ARGOCD_SERVER>`
- `<ARGOCD_APP_NAME>`
- `<SONAR_HOST_URL>`
- `<SONAR_TOKEN>`
- `<CHECKMARX_TENANT>`
- `<CHECKMARX_BASE_URI>`
- `<SLACK_WEBHOOK_URL>`
- `<TEAMS_WEBHOOK_URL>`

## Usage Rules

- Never hardcode account IDs, tenant IDs, tokens, or webhook URLs.
- Never commit real environment-specific secrets.
- Keep placeholders in docs, workflow defaults, and example manifests.
- Replace placeholders only in the destination repository or deployment environment.
