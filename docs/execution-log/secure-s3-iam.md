# Day 6 — Secure S3 Infrastructure with IAM (LocalStack + Terraform)

## Objective
Build and validate an enterprise-grade Amazon S3 infrastructure module with mandatory security controls and least-privilege IAM access, executed locally using LocalStack to simulate real AWS behavior without cost or production risk.

The purpose of this step was to treat security as part of the infrastructure itself, not as a post-deployment task.

---

## Context
Object storage is one of the most frequently misconfigured services in cloud environments. This step focuses on eliminating common S3 security risks at design time rather than relying on operational fixes later.

The design intent was to ensure that any S3 bucket created through this module is secure by default and aligned with real enterprise standards.

Core goals:
- Enforce security controls at creation time
- Prevent any form of public exposure
- Enable auditability and recovery
- Apply strict least-privilege IAM access
- Validate all behavior locally before real AWS usage

---

## What Was Implemented

A dedicated Terraform S3 module was created and extended with security-first defaults.

The following controls were implemented as a single baseline:
- Secure S3 bucket creation
- Server-side encryption enabled using AES256
- Object versioning enabled to support rollback and recovery
- Public access fully blocked using S3 public access block configuration
- Least-privilege IAM read-only policy scoped only to the target bucket
- Clean module wiring into the dev environment
- LocalStack-first execution to avoid real AWS dependency

This ensures that the bucket cannot exist in an insecure or publicly exposed state.

---

## Environment Integration
The secure S3 module was wired into the dev environment to validate real-world infrastructure behavior.

This confirmed:
- Module reusability across environments
- Proper environment isolation
- Predictable Terraform state behavior during apply and re-apply cycles

The module behaves as reusable infrastructure, not as a one-time script.

---

## Validation Performed
After provisioning, the following validations were performed locally:
- S3 bucket existence and configuration verified via awslocal
- Encryption status confirmed
- Versioning status confirmed
- Public access effectively blocked
- IAM read-only policy creation validated

All validations were performed without interacting with real AWS services.

---

## Final Result
- Terraform apply completed successfully
- Secure S3 bucket created with enforced security controls
- Encryption, versioning, and public access blocking verified
- IAM read-only policy created and scoped correctly
- Infrastructure validated entirely through LocalStack

This step produced a production-aligned S3 baseline suitable for extension.

---

## Key Learnings
- Security is most effective when enforced at infrastructure design time
- S3 should never be created without encryption and access controls
- Least-privilege IAM policies must be intentional and scoped
- LocalStack enables safe validation of real AWS behavior
- Terraform modules should encode standards, not optional settings

---

## Status
Completed:
- Secure S3 module implemented
- IAM policy validated
- Dev environment integration complete
- Ready for logging, IAM roles, and cross-service integration
