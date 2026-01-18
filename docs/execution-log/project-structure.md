<!--
DOC TYPE: Architecture Reference
PHASE: Architecture
DAY: 2
PURPOSE: Project folder structure and Terraform module layout
READ MODE: SKIM
-->



# Day 2 — Project Architecture & Folder Structure

## Objective
Design a scalable Terraform project structure that mirrors real enterprise cloud environments.

## Step-by-Step Execution

1. Created a dedicated Terraform project root.
2. Separated infrastructure into reusable modules.
3. Isolated environments to avoid configuration mixing.
4. Ensured structure supports future AWS deployment (not only LocalStack).

### Folder Structure Created

The project follows a layered, enterprise-aligned structure:

- `ROADMAP/` → Project roadmap and execution plan
- `docs/` → Architecture documentation, notes, and screenshots
  - `architecture/` → High-level system design
  - `notes/` → Day-wise implementation notes
  - `screenshots/` → Validation evidence
- `localstack/` → Local AWS simulation configuration
- `infrastructure/` → Conceptual cloud layers (networking, compute, storage)
- `environments/` → Terraform execution environments
  - `dev/` → LocalStack-based development
  - `prod/` → Future AWS production deployment
- `modules/` → Reusable Terraform modules (VPC, IAM, S3, EC2, etc.)
- `logs/` → CLI and Terraform execution logs
- `scripts/` → Utility and automation scripts

- modules/ → reusable infrastructure units
- environments/dev → active development workspace
- docs/ → architecture and design documentation
- scripts/ → helper automation scripts
- logs/ → runtime and debug logs

## Architecture Decision
Terraform → LocalStack → Simulated AWS services

## Reference
Detailed architecture is documented in:
- `docs/project-architecture-v1.md`

## Outcome
Project structure now matches real-world cloud engineering standards.


