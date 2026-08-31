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
│   ┌──────────────────────────────┐    ┌──────────────────────────────┐      │
│   │      AVAILABILITY ZONE 1     │    │      AVAILABILITY ZONE 2     │      │
│   │                              │    │                              │      │
│   │   PUBLIC SUBNET              │    │   PUBLIC SUBNET              │      │
│   │                              │    │                              │      │
│   │   ┌──────────────────────┐   │    │   ┌──────────────────────┐   │      │
│   │   │         ALB          │───┼────┼──▶│         ALB          │   │      │
│   │   └──────────┬───────────┘   │    │   └──────────┬───────────┘   │      │
│   │              │               │    │              │               │      │
│   │   PRIVATE SUBNET             │    │   PRIVATE SUBNET             │      │
│   │              │               │    │              │               │      │
│   │   ┌──────────▼───────────┐   │    │   ┌──────────▼───────────┐   │      │
│   │   │       EC2 / ASG      │   │    │   │       EC2 / ASG      │   │      │
│   │   │   Application Tier   │   │    │   │   Application Tier   │   │      │
│   │   └──────────┬───────────┘   │    │   └──────────┬───────────┘   │      │
│   │              │               │    │              │               │      │
│   └──────────────┼───────────────┘    └──────────────┼───────────────┘      │
│                  │                                   │                      │
│                  └─────────────────┬─────────────────┘                      │
│                                    │                                        │
│                                    ▼                                        │
│                         ┌──────────────────────┐                            │
│                         │    RDS PostgreSQL    │                            │
│                         │    Database Tier     │                            │
│                         │       Multi-AZ       │                            │
│                         └──────────────────────┘                            │
│                                                                              │
│                  ┌──────────────────────────────┐                            │
│                  │        NAT Gateway           │                            │
│                  │   Private Subnet Egress      │                            │
│                  └──────────────┬───────────────┘                            │
│                                 │                                            │
└─────────────────────────────────┼────────────────────────────────────────────┘
                                  │
                                  ▼
                           INTERNET GATEWAY
                                  │
                                  ▼
                               INTERNET


                         ┌────────────────────────┐
                         │    S3 Object Storage   │
                         │  Static Assets / Data  │
                         └────────────────────────┘

```
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
                    ┌─────────────────────────┐
                    │ Application Load Balancer│
                    └────────────┬────────────┘
                                 │
                    ┌────────────┴────────────┐
                    │                         │
                    ▼                         ▼
        ┌──────────────────────┐   ┌──────────────────────┐
        │ Availability Zone 1  │   │ Availability Zone 2  │
        │                      │   │                      │
        │ Public Subnet        │   │ Public Subnet        │
        │                      │   │                      │
        │ Private Subnet       │   │ Private Subnet       │
        │ ┌──────────────────┐ │   │ ┌──────────────────┐ │
        │ │    EC2 / ASG     │ │   │ │    EC2 / ASG     │ │
        │ │ Application Tier │ │   │ │ Application Tier │ │
        │ └────────┬─────────┘ │   │ └────────┬─────────┘ │
        └───────────┼──────────┘   └──────────┼──────────┘
                    │                         │
                    └────────────┬────────────┘
                                 │
                                 ▼
                       ┌────────────────────┐
                       │   RDS PostgreSQL   │
                       │     Multi-AZ       │
                       └────────────────────┘


                    Private Subnet Egress
                              │
                              ▼
                    ┌────────────────────┐
                    │    NAT Gateway     │
                    └─────────┬──────────┘
                              │
                              ▼
                       Internet Gateway
                              │
                              ▼
                           INTERNET


                       ┌───────────────────┐
                       │  S3 Object Storage │
                       │ Static Assets/Data │
                       └───────────────────┘
```
---

# AWS Services

## ☁️ AWS Services

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

## 🧱 Infrastructure Design

The infrastructure follows a layered AWS architecture with public and private subnets, load-balanced application servers, and a private PostgreSQL database.


---

# Repository Structure

```markdown
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
