<!--
DOC TYPE: Security Design
PHASE: Identity & Access Management Foundation
DAY: 7
SERVICE: AWS IAM (Simulated via LocalStack)
PURPOSE: Enforce least-privilege access control for S3 resources
READ MODE: READ
-->



## Day 7 — IAM Least Privilege for S3 Access (LocalStack + Terraform)

### Objective
Apply least-privilege IAM access control for the S3 bucket created earlier,
using Terraform and validating the setup locally with LocalStack.

---

### Execution Summary
IAM access control was implemented using a custom policy strictly scoped to a single S3 bucket.
A role-based access model was used to avoid over-permissioning and IAM users.

---

### What Was Implemented
- Custom IAM policy limited to one S3 bucket
- Separate permissions for bucket-level and object-level actions
- IAM role created and used instead of IAM users
- IAM policy attached to role using Terraform
- IAM resources integrated with existing S3 module

---

### IAM Design Highlights
- No AdministratorAccess permissions
- No wildcard permissions (such as s3:*)
- Access restricted to a specific bucket only
- Explicit allow rules defined
- Role-based identity model followed

---

### Issues Faced & Fixes

**Issue: IAM InvalidClientTokenId Error**

- What Happened: Terraform failed while creating IAM resources
- Error Message: InvalidClientTokenId
- Root Cause: IAM and STS service endpoints were not mapped to LocalStack by default
- Fix Applied: Explicitly configured IAM and STS endpoints in the Terraform provider
- Key Learning: LocalStack does not expose IAM/STS automatically; endpoints must be defined explicitly

---

### Outcome
- IAM policy and role created successfully
- Least-privilege access validated for S3
- Terraform apply completed without errors

---

### Status
- IAM access validated
- S3 access securely controlled
- Ready for compute integration (EC2 / Lambda)
