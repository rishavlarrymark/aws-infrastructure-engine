# Day 6 — Secure S3 Infrastructure with IAM (LocalStack + Terraform)

# Secure S3 + IAM — Execution Summary (LocalStack + Terraform)

## Objective
Design and validate a production-style **secure S3 module** with **least-privilege IAM**, tested locally using **Terraform + LocalStack**.

---

## What Was Implemented
- Encrypted S3 bucket (AES256)
- Versioning enabled
- Public access fully blocked
- Read-only IAM policy for S3
- Modular Terraform design wired to dev environment

This validated:
- Module reusability
- Environment isolation
- Safe Terraform state behavior

---

## Issues Faced & Fixes

**Provider v6 breaking changes**  
Fixed deprecated arguments after provider upgrade.

**LocalStack connection failure (4566)**  
Root cause: container not running.  
Fix: started container and verified health endpoint.

**IAM InvalidClientTokenId**  
Root cause: IAM/STS endpoints not routed to LocalStack.  
Fix: explicitly configured IAM and STS endpoints.

---

## Final Result
- Secure S3 bucket created successfully
- IAM policy validated
- Terraform apply completed cleanly
- All resources provisioned locally with AWS-like behavior

---

## Key Learnings
- Security must be enforced at design time
- Provider upgrades require careful review
- LocalStack needs explicit endpoint configuration
- Debugging skills matter more than happy-path setups

---

## Status
✅ Secure S3 module complete  
✅ IAM validated  
✅ Ready for extensions (roles, logging, cross-account)
