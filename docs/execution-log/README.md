# Execution Logs — AWS Cloud Infrastructure Engine

This directory contains execution-level documentation for major infrastructure components.
Each document captures **what was implemented**, **why it was designed that way**, and **how it was validated** using Terraform and LocalStack.

The files are intentionally named by **domain and responsibility**, not by timeline, to reflect real-world engineering practices.

---

## Execution Order (Logical Flow)

### 1. Foundation
- `foundation.md`  
  Local development setup, tooling validation, and LocalStack readiness.

---

### 2. Terraform State & Backend
- `terraform-backend.md`  
  Terraform state design, backend choice, and lifecycle understanding.

---

### 3. Project Structure & Version Control
- `project-structure.md`  
  Enterprise-style Terraform folder layout and modular separation.

- `git-version-control.md`  
  Git hygiene, commit discipline, and infrastructure-safe version control.

---

### 4. Local AWS Simulation
- `localstack-basics.md`  
  LocalStack architecture, endpoints, and AWS service simulation strategy.

---

### 5. Secure Storage
- `secure-s3.md`  
  Secure-by-default S3 bucket implementation with encryption, versioning, and public access blocking.

---

### 6. Identity & Access Management
- `iam-least-privilege.md`  
  IAM least-privilege access control using scoped policies and role-based access.

---

## Design Philosophy

- Semantic file naming over timeline-based naming
- Documentation order defined explicitly via this index
- Security and access controls treated as first-class infrastructure concerns
- Local-first validation before any real AWS usage

---

## Audience

This documentation is intended for:
- Cloud Engineers
- DevOps Engineers
- Infrastructure Engineers
- Infrastructure reviewers
- Technical interview evaluations
