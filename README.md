# ☁️ AWS Infrastructure Automation Platform using Terraform

### Terraform-Driven Infrastructure • Secure by Design • Cost-Aware

<p>
  <img src="https://img.shields.io/badge/AWS-Infrastructure-orange?logo=amazonaws&logoColor=white" alt="AWS">
  <img src="https://img.shields.io/badge/Terraform-IaC-7B42BC?logo=terraform&logoColor=white" alt="Terraform">
  <img src="https://img.shields.io/badge/GitHub%20Actions-CI%2FCD-2088FF?logo=githubactions&logoColor=white" alt="GitHub Actions">
  <img src="https://img.shields.io/badge/LocalStack-Development-00A98F?logo=localstack&logoColor=white" alt="LocalStack">
  <img src="https://img.shields.io/badge/Security-Least%20Privilege-critical" alt="Security">
  <img src="https://img.shields.io/badge/Cost-Aware-success" alt="Cost Aware">
</p>

<p>
  <b>Infrastructure as Code</b> ·
  <b>Multi-Tier Architecture</b> ·
  <b>High Availability</b> ·
  <b>Infrastructure Automation</b>
</p>

</div>

---

> A Terraform-driven AWS infrastructure project for designing, provisioning, securing, automating, and validating a multi-tier web application environment.


---

## Overview

**AWS Infrastructure Automation Platform using Terraform** is an Infrastructure as Code (IaC) project that builds and manages a multi-tier web application infrastructure on AWS.

The project uses reusable Terraform modules and separate environments to manage:

- Networking — VPC, subnets, routing, NAT Gateway, Security Groups
- Compute — EC2, Launch Templates, Auto Scaling
- Load Balancing — Application Load Balancer
- Database — RDS PostgreSQL
- Storage — S3 and EBS
- Security — IAM and least-privilege access
- Monitoring — CloudWatch
- CI/CD — GitHub Actions and Terraform

LocalStack is used where practical for local development and testing before deploying to AWS.

The project focuses on **automation, security, scalability, high availability, and cost awareness**.

---

### 🎯 Core Objectives

| Area | Objective |
|---|---|
| **IaC** | Manage AWS infrastructure using Terraform |
| **Networking** | Design isolated public/private network layers |
| **Compute** | Deploy scalable EC2-based workloads |
| **Database** | Integrate RDS PostgreSQL |
| **Storage** | Use S3 and EBS appropriately |
| **Security** | Apply least-privilege access |
| **Availability** | Design for Multi-AZ and failure recovery |
| **Automation** | Automate infrastructure deployment |
| **CI/CD** | Validate and deploy Terraform through GitHub Actions |
| **Operations** | Validate infrastructure and troubleshoot failures |
| **Cost** | Apply cost-aware infrastructure decisions |

---
## 🏗️ Architecture

### High-Level Architecture

```text
                                      INTERNET
                                         │
                                         ▼
                              ┌────────────────────┐
                              │  Internet Gateway  │
                              └─────────┬──────────┘
                                        │
                                        ▼
┌──────────────────────────────────────────────────────────────────────────────┐
│                                  AWS VPC                                    │
│                                                                              │
│                         ┌─────────────────────────┐                          │
│                         │  Application Load       │                          │
│                         │      Balancer           │                          │
│                         │     (ALB)               │                          │
│                         │   Security Group        │                          │
│                         └────────────┬────────────┘                          │
│                                      │                                       │
│                     ┌────────────────┴────────────────┐                      │
│                     │                                 │                      │
│                     ▼                                 ▼                      │
│   ┌──────────────────────────────┐    ┌──────────────────────────────┐      │
│   │      AVAILABILITY ZONE 1     │    │      AVAILABILITY ZONE 2     │      │
│   │                              │    │                              │      │
│   │  ┌────────────────────────┐  │    │  ┌────────────────────────┐  │      │
│   │  │      PUBLIC SUBNET     │  │    │  │      PUBLIC SUBNET     │  │      │
│   │  │      NACL              │  │    │  │      NACL              │  │      │
│   │  │                        │  │    │  │                        │  │      │
│   │  │    NAT Gateway 1       │  │    │  │    NAT Gateway 2       │  │      │
│   │  └────────────┬───────────┘  │    │  └────────────┬───────────┘  │      │
│   │               │              │    │               │              │      │
│   │  ┌────────────▼───────────┐  │    │  ┌────────────▼───────────┐  │      │
│   │  │     PRIVATE SUBNET     │  │    │  │     PRIVATE SUBNET     │  │      │
│   │  │      NACL              │  │    │  │      NACL              │  │      │
│   │  │                        │  │    │  │                        │  │      │
│   │  │     EC2 / ASG          │  │    │  │     EC2 / ASG          │  │      │
│   │  │   Security Group       │  │    │  │   Security Group       │  │      │
│   │  │  Application Tier      │  │    │  │  Application Tier      │  │      │
│   │  └────────────┬───────────┘  │    │  └────────────┬───────────┘  │      │
│   │               │              │    │               │              │      │
│   └───────────────┼──────────────┘    └───────────────┼──────────────┘      │
│                   │                                   │                     │
│                   └─────────────────┬─────────────────┘                     │
│                                     │                                       │
│                                     ▼                                       │
│                          ┌──────────────────────┐                           │
│                          │   RDS PostgreSQL     │                           │
│                          │      Multi-AZ        │                           │
│                          │    Database Tier     │                           │
│                          │   Security Group     │                           │
│                          └──────────────────────┘                           │
│                                                                              │
└──────────────────────────────────────────────────────────────────────────────┘

                         ┌─────────────────────────┐
                         │     S3 Object Storage   │
                         │   Static Assets / Data  │
                         └─────────────────────────┘

```

---

# ☁️ AWS Services

### 🌐 Networking

| AWS Service | Role |
|---|---|
| **Amazon VPC** | Network isolation |
| **Public Subnets** | Internet-facing resources |
| **Private Subnets** | Backend resources |
| **Route Tables** | Traffic routing |
| **Internet Gateway** | Internet connectivity |
| **NAT Gateway** | Outbound internet access |
| **Security Groups** | Stateful traffic control |
| **Network ACLs** | Subnet-level traffic control |
| **Elastic IP** | Static public addressing |
| **Route 53** | DNS management *(optional)* |

### 🖥️ Compute & Load Balancing

| AWS Service | Role |
|---|---|
| **Amazon EC2** | Application compute |
| **Launch Templates** | Standardized instance configuration |
| **Auto Scaling Groups** | Horizontal scaling and replacement |
| **Application Load Balancer** | Traffic distribution |
| **Target Groups** | Backend registration |
| **Health Checks** | Application health validation |

### 🗄️ Storage & Database

| AWS Service | Role |
|---|---|
| **Amazon S3** | Object/static asset storage |
| **Amazon EBS** | EC2 block storage |
| **Amazon RDS PostgreSQL** | Relational application database |

### 🔐 Identity & Security

| Component | Purpose |
|---|---|
| **IAM Roles** | AWS service permissions |
| **IAM Policies** | Permission control |
| **IAM Instance Profiles** | EC2 AWS access |
| **Least Privilege** | Minimize permissions |
| **KMS** | Encryption *(optional)* |
| **Secrets Manager** | Secret management *(optional)* |

### 📊 Monitoring

- Amazon CloudWatch
- Infrastructure metrics
- Basic logs
- Health monitoring
- Operational visibility

---

## 🧩 Terraform Architecture

Terraform is organized using reusable modules:

```text
environments/
├── dev/
├── stage/
└── prod/

modules/
├── vpc/
├── ec2/
├── alb/
├── rds/
├── s3/
├── iam/
└── cloudwatch/

```
---


### 2. Security

```markdown
## 🔐 Security

Security is incorporated into the infrastructure design rather than added after deployment.

Key practices include:

- Least-privilege IAM policies
- IAM roles instead of embedded credentials
- IAM instance profiles for EC2
- Private subnets for backend resources
- Restricted security-group rules
- Network ACL controls
- Secrets Manager for sensitive application secrets
- KMS encryption where required
- No hard-coded AWS credentials
- Sensitive Terraform files excluded through `.gitignore`

```
---

## 💰 Cost Awareness

The project considers AWS cost during infrastructure design.

Key practices include:

- Environment separation
- Right-sized resources
- Controlled NAT Gateway usage
- Appropriate storage configuration
- Resource tagging
- Avoiding unnecessary always-on resources
- LocalStack-based development where practical
- Destroying temporary AWS environments after testing

---

## 🚀 Application Deployment

A sample multi-tier web application is deployed on the infrastructure created by Terraform.

### Application Flow

```text
User
 │
 ▼
ALB
 │
 ▼
EC2 / Auto Scaling Group
 │
 ▼
RDS PostgreSQL

```

### The application demonstrates:

- Application server configuration
- Environment variables
- Database connectivity
- S3 integration
- IAM permissions
- Application health checks
- Basic failure and recovery testing

---


### 5. Infrastructure CI/CD

```markdown
## 🔄 Infrastructure CI/CD

GitHub Actions automates the Terraform infrastructure workflow.

### Pipeline

```text
Developer
    │
    ▼
GitHub Pull Request
    │
    ▼
Terraform Format
    │
    ▼
Terraform Validate
    │
    ▼
Security Scan
    │
    ▼
Terraform Plan
    │
    ▼
Review / Approval
    │
    ▼
Terraform Apply
    │
    ▼
AWS Infrastructure

```
### CI/CD Capabilities

- GitHub Actions
- Pull Request workflow
- Terraform formatting
- Terraform validation
- Security scanning
- Terraform plan
- Manual approval
- Terraform apply
- Branch protection
- Dev / Stage / Prod deployment
- AWS OIDC authentication


---


### 6. Testing & Validation

```markdown
## 🧪 Testing & Validation

### Infrastructure

- Terraform validation
- Infrastructure provisioning
- Resource verification
- Network connectivity testing
- Security validation

### Application

- Application accessibility
- ALB health checks
- Database connectivity
- S3 integration
- Application health checks

### Reliability

- Auto Scaling validation
- Instance replacement
- Load balancer health checks
- Failure testing
- Recovery testing

### Cost

- Resource review
- Environment cleanup
- Cost-aware configuration validation

---
# Repository Structure

```

---

## 📁 Repository Structure

```text
aws-infrastructure-engine/
│
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── provider.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── terraform.tfvars
│   │
│   ├── stage/
│   │   ├── main.tf
│   │   ├── provider.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── terraform.tfvars
│   │
│   └── prod/
│       ├── main.tf
│       ├── provider.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── terraform.tfvars
│
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── alb/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── rds/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── s3/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── iam/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── cloudwatch/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── application/
│   ├── README.md
│   └── deployment/
│       └── README.md
│
├── .github/
│   └── workflows/
│       └── terraform.yml
│
├── docs/
│   ├── architecture.md
│   ├── deployment.md
│   └── troubleshooting.md
│
├── scripts/
│   └── validate.sh
│
├── .gitignore
├── README.md
└── LICENSE

---

🎯 Key Learning Outcomes

This project demonstrates practical knowledge of:

AWS networking
EC2 infrastructure
Load balancing
Auto Scaling
Relational databases
Object storage
IAM and security
High availability
Infrastructure as Code
Terraform modules
Environment management
Infrastructure CI/CD
AWS OIDC
Application deployment
Troubleshooting
Cost-aware infrastructure design

---

📌 Project Summary

AWS Infrastructure Automation Platform using Terraform demonstrates how to design, automate, secure, deploy, and validate a multi-tier AWS web application infrastructure using Infrastructure as Code and CI/CD practices.

--
👨‍💻 Author

Rishav Kumar Giri

-- 

📄 License

This project is licensed under the MIT License.


### One correction before you paste it

Your actual repository is now:

```text
aws-infrastructure-engine
