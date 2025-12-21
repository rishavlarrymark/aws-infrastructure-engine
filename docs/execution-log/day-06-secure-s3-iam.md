# Day 6 — Secure S3 Infrastructure with IAM (LocalStack + Terraform)

## Objective
Build an enterprise-grade S3 module with mandatory security controls and least-privilege IAM,
validated locally using LocalStack.

## What Was Implemented
- Secure S3 bucket
- Server-side encryption (AES256)
- Versioning enabled
- Public access blocked
- Least-privilege IAM read-only policy
- Terraform module wiring with dev environment
- LocalStack-first execution

## Key Issues Faced & Resolutions
### 1. Terraform provider v6 breaking changes
- Fixed deprecated attributes and provider config.

### 2. LocalStack not running
- Detected connection refusal on port 4566.
- Resolved by starting LocalStack container.

### 3. IAM InvalidClientTokenId error
- Root cause: IAM endpoint not routed to LocalStack.
- Fixed by explicitly configuring IAM + STS endpoints.

## Final Result
- Terraform apply successful
- S3 bucket created and verified via awslocal
- IAM policy created successfully

## Key Learnings
- Terraform state safety and idempotency
- Importance of explicit service endpoints in LocalStack
- Real-world debugging workflow
