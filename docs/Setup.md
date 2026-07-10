# Setup

## Prerequisites

- GitHub Enterprise organization and repository
- AWS account and IAM role for GitHub OIDC
- ECR repository
- EKS cluster and namespace
- ArgoCD installation
- SonarQube project and token
- Checkmarx tenant and application profile
- Slack or Teams webhook endpoint

## Repository Bootstrap

1. Create the repository from this template.
2. Configure repository variables.
3. Add the required GitHub secrets.
4. Create the four GitHub environments.
5. Apply branch protection to the default branch.
6. Connect the repo to the GitOps target repository.

## Runtime Dependencies

- Bash
- Docker
- Helm
- AWS CLI
- `jq` for JSON handling where needed
- `yq` for GitOps manifest updates where preferred

