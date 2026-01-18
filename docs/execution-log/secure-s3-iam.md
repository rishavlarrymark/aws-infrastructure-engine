<!--
DOC TYPE: Security Design
PHASE: Security Foundation
DAY: 6–7
PURPOSE: Secure S3 configuration with IAM least privilege
READ MODE: READ
-->




## Secure S3 Infrastructure with IAM (LocalStack + Terraform)

### Objective
Design, implement, and validate a production-style secure S3 module with least-privilege IAM,
tested locally using Terraform and LocalStack without real AWS usage.

---

### Execution Summary
A secure S3 infrastructure was built as part of the infrastructure engine and validated end-to-end
using LocalStack. Security and access control were enforced directly in Terraform design.

---

### What Was Implemented
- Encrypted S3 bucket using AES256
- S3 versioning enabled for data protection
- Public access fully blocked at bucket level
- Least-privilege IAM policy scoped to the S3 bucket
- Modular Terraform design integrated with dev environment

---

### What This Validated
- Terraform module reusability
- Clear environment isolation (dev)
- Safe Terraform state behavior
- AWS-like service behavior in LocalStack

---

### Issues Faced & Fixes

**Provider v6 Breaking Changes**
- Issue: Deprecated arguments caused plan/apply failures  
- Fix: Updated Terraform configuration to align with provider v6 syntax  

**LocalStack Connection Failure (Port 4566)**
- Issue: Terraform could not reach LocalStack endpoints  
- Root Cause: LocalStack container not running  
- Fix: Started container and verified health endpoint  

**IAM InvalidClientTokenId**
- Issue: IAM operations failing during Terraform apply  
- Root Cause: IAM and STS endpoints not routed to LocalStack  
- Fix: Explicitly configured IAM and STS endpoints in provider block  

---

### Final Result
- Secure S3 bucket created successfully
- IAM policy attached and validated
- Terraform apply completed without errors
- All resources provisioned locally with AWS-like behavior

---

### Key Learnings
- Security must be enforced at design time, not added later
- Provider upgrades require careful review of breaking changes
- LocalStack needs explicit endpoint configuration for IAM/STS
- Debugging and troubleshooting are critical cloud engineering skills

---

### Status
- Secure S3 module complete
- IAM access validated
- Ready for future extensions (roles, logging, cross-account access)
