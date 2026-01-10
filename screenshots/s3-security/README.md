# S3 Security Proof

Real screenshots proving **secure S3 bucket creation via Terraform**.

## Verified
- Encryption enabled (AES256)
- Versioning enabled
- Public access blocked
- Created via IaC (Terraform)

## Commands
- `terraform apply`
- `awslocal s3 ls`
- `awslocal s3api get-bucket-encryption`
- `awslocal s3api get-bucket-versioning`
