<!--
DOC TYPE: Core Concept
PHASE: Terraform Core
DAY: 4
PURPOSE: Terraform backend configuration and state management
READ MODE: READ
-->



# Day 4 — Terraform Backend & State Design

## Objective
Understand how Terraform state works without involving real AWS resources.

## Step-by-Step Execution

1. Chose local backend for learning and simulation.
2. Avoided S3 and DynamoDB to remove cloud dependency.
3. Inspected Terraform state structure manually.
4. Reset and reinitialized state multiple times to observe behavior.

## Backend Configuration Used
- Backend: local
- State file: terraform.tfstate

## Terraform Initialization
Command executed:
terraform init

## State Observation
- State file created locally
- No remote locking
- Easy inspection and reset

## Reference
Design details documented in:
- `docs/terraform-backend-design.md`

## Outcome
Clear understanding of Terraform backend mechanics and state lifecycle.

