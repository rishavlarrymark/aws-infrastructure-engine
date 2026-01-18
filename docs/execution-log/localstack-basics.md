<!--
DOC TYPE: Setup Guide
PHASE: Local Development
DAY: 3
PURPOSE: AWS CLI and LocalStack setup and validation before Terraform
READ MODE: SKIM
-->



## AWS CLI, LocalStack & Command Validation

### Objective
Gain hands-on control over AWS services using the CLI before introducing automation with Terraform.

---

### Step-by-Step Execution
- Configured AWS CLI profile for LocalStack
- Used fake credentials (no real AWS access involved)
- Verified LocalStack service endpoints using `awslocal`
- Executed real AWS-style CLI commands locally

---

### Commands Executed
- Created an S3 bucket
- Uploaded a test object to S3
- Created an IAM user
- Queried available EC2 regions

---

### Sample Outputs
- Command outputs were captured and manually verified
- Validated expected AWS-like behavior in LocalStack

---

### Reference
- docs/outputs-samples.md
- docs/cli-command-cheatsheet.md

---

### Outcome
AWS service behavior was successfully validated in a local environment,
ensuring readiness for Terraform-based automation in later stages.
