# Day 2 — Project Architecture & Folder Structure

## Objective
Design a scalable Terraform project structure that mirrors real enterprise cloud environments.

## Step-by-Step Execution

1. Created a dedicated Terraform project root.
2. Separated infrastructure into reusable modules.
3. Isolated environments to avoid configuration mixing.
4. Ensured structure supports future AWS deployment (not only LocalStack).

## Folder Structure Created
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
