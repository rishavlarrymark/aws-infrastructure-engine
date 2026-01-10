# IAM Security Proof

Real screenshots proving **least-privilege IAM configuration via Terraform**.

## Verified
- Custom IAM role
- Scoped permissions (no admin / wildcard)
- Explicit policy attachment

## Commands
- `terraform apply`
- `awslocal iam list-roles`
- `awslocal iam get-role`
