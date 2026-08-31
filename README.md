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

## 📚 Table of Contents

- [Overview](#-overview)
- [Architecture](#️-architecture)
- [AWS Services](#-aws-services)
- [Infrastructure Design](#-infrastructure-design)
- [Terraform Architecture](#-terraform-architecture)
- [Environment Strategy](#-environment-strategy)
- [Security](#-security)
- [Cost Awareness](#-cost-awareness)
- [Application Deployment](#-application-deployment)
- [Infrastructure CI/CD](#-infrastructure-cicd)
- [Testing & Validation](#-testing--validation)
- [Troubleshooting](#-troubleshooting)
- [Repository Structure](#-repository-structure)
- [Learning Outcomes](#-learning-outcomes)
- [Project Scope](#-project-scope)
- [Getting Started](#-getting-started)

---

## 🎯 Overview

**AWS Infrastructure Automation Platform using Terraform** is an Infrastructure as Code (IaC) project focused on designing, provisioning, securing, automating, and validating AWS infrastructure for a multi-tier web application.

The project uses **Terraform modules** and **environment-based configurations** to manage:

- 🌐 Networking
- 🖥️ Compute
- ⚖️ Load Balancing
- 🗄️ Relational Database
- 📦 Object Storage
- 🔐 Identity & Security
- 📊 Infrastructure Monitoring
- 🔄 Infrastructure CI/CD

The project follows a **local-first development approach** where LocalStack is used where practical for development and experimentation, while Terraform configurations are designed to remain compatible with real AWS environments.

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
                         ┌─────────────────┐
                         │  Route 53       │
                         │   (Optional)    │
                         └────────┬────────┘
                                  │
                                  ▼
                    ┌──────────────────────────┐
                    │ Application Load Balancer│
                    │          (ALB)           │
                    └────────────┬─────────────┘
                                 │
                  ┌──────────────┴──────────────┐
                  │                             │
                  ▼                             ▼
          ┌──────────────┐              ┌──────────────┐
          │ EC2 Instance │              │ EC2 Instance │
          │      #1      │              │      #2      │
          └──────┬───────┘              └──────┬───────┘
                 │                             │
                 └──────────────┬──────────────┘
                                │
                                ▼
                     ┌─────────────────────┐
                     │   RDS PostgreSQL    │
                     │    Private Subnet   │
                     └─────────────────────┘

                         ┌──────────────┐
                         │     S3       │
                         │ Object Store │
                         └──────────────┘

```
---

### 🔄 Request Flow

```text
User
  │
  ▼
Application Load Balancer
  │
  ▼
EC2 / Auto Scaling Group
  │
  ▼
RDS PostgreSQL
```

**Purpose:** Shows the application request/response path from the user to the application and database.

---

### 🌐 Network Flow

```text
                         Internet
                            │
                            ▼
                    Internet Gateway
                            │
                            ▼
                           VPC
                            │
             ┌──────────────┴──────────────┐
             │                             │
             ▼                             ▼
       Public Subnets                Private Subnets
             │                             │
             ▼                       ┌─────┴─────┐
            ALB                       │           │
                                     ▼           ▼
                                    EC2         RDS
                                     │
                                     ▼
                                NAT Gateway
                                     │
                                     ▼
                              Internet Gateway
                                     │
                                     ▼
                                  Internet
```

**Purpose:** Shows public/private subnet segmentation, internet connectivity, and outbound internet access for private resources.

---

# 5. AWS Services

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
