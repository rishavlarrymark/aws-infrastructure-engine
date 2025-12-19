# Day 4 — Terraform Backend & State Design

## Reason for Local Backend

- No real AWS dependency
- No S3 bucket required
- No DynamoDB state locking
- Easy to inspect and reset
- Ideal for learning and simulation

---

## Terraform Block

```hcl
terraform {
  required_version = ">= 1.0"

  backend "local" {
    path = "terraform.tfstate"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
```

---

## AWS Provider (LocalStack)

Terraform AWS provider is configured to communicate with LocalStack.

```hcl
provider "aws" {
  region      = "us-east-1"
  access_key = "test"
  secret_key = "test"

  endpoints {
    s3 = "http://localhost:4566"
  }
}
```

---

## Initialization Command

```bash
terraform init
```

---

## Terraform State (Initial)

```json
{
  "version": 4,
  "terraform_version": "1.x",
  "serial": 1,
  "outputs": {},
  "resources": []
}
```

---

## Outcome

Terraform backend successfully initialized.
