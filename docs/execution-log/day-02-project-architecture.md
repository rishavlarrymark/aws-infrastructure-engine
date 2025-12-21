# ===============================
# 📅 DAY 2 — PROJECT ARCHITECTURE
# ===============================

# Day 2 — Project Architecture & Folder Structure

## Objective
Design a scalable, enterprise-grade Terraform project structure.

## Architecture Design

### Terraform Modules
Each AWS service gets its own module:

- modules/s3
- modules/iam
- modules/ec2
- modules/vpc
- modules/lambda
- modules/sqs
- modules/sns
- modules/dynamodb
- modules/cloudwatch

### Environment Isolation
Separate environments created:

- environments/dev
- environments/stage
- environments/prod

Each environment:
- Uses same modules
- Has independent Terraform state
- Can be deployed independently

## Folder Structure
```text
AWS-Cloud-Simulation-Engine/
├── modules/
├── environments/
├── docs/
├── scripts/
├── logs/
