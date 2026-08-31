# AWS Infrastructure Automation Platform using Terraform (Terraform-Driven, Secure & Cost-Aware)
*(LocalStack for Development · AWS for Production Deployment)*

![Terraform](https://img.shields.io/badge/Terraform-IaC-blueviolet)
![AWS](https://img.shields.io/badge/AWS-Simulated-orange)
![LocalStack](https://img.shields.io/badge/LocalStack-Enabled-blue)
![Security](https://img.shields.io/badge/Security-Secure--by--Default-critical)
![Cost](https://img.shields.io/badge/Cost-Cost--Aware-success)

---

## Overview

**AWS Infrastructure Automation Platform using Terraform** is an Infrastructure as Code (IaC) project focused on designing, provisioning, and validating secure, scalable, and highly available AWS infrastructure for a multi-tier web application.

The project uses **Terraform modules** and **environment-based configurations** to provision AWS networking, compute, load balancing, storage, database, identity, and monitoring resources.

**LocalStack** is used where practical for local development and experimentation, while Terraform configurations are designed for deployment to real AWS environments.

---

## 🎯 Project Goal

The goal is to build a strong foundation in **AWS infrastructure engineering and Infrastructure as Code** by designing and automating a complete traditional web application infrastructure.

The project focuses on:

- AWS infrastructure design
- Infrastructure as Code with Terraform
- Reusable Terraform modules
- Secure infrastructure configuration
- High availability and fault tolerance
- Environment separation
- Infrastructure automation
- Infrastructure CI/CD
- Application deployment and validation
- Cost-aware infrastructure design

---

## 🏗️ Architecture

### High-Level Architecture

```text
                         Internet
                            │
                            ▼
                     Route 53 (Optional)
                            │
                            ▼
                 Application Load Balancer
                            │
                            ▼
                    EC2 / Auto Scaling
                         Group
                            │
                  ┌─────────┴─────────┐
                  ▼                   ▼
           RDS PostgreSQL             S3
           (Private Subnet)      (Object Storage)
Network Architecture
                         VPC
                          │
             ┌────────────┴────────────┐
             │                         │
       Public Subnets             Private Subnets
             │                         │
          ALB / NAT              EC2 / RDS
             │
        Internet Gateway
☁️ AWS Services
Networking
Service	Purpose
Amazon VPC	Network isolation
Public & Private Subnets	Workload segmentation
Route Tables	Traffic routing
Internet Gateway	Internet connectivity
NAT Gateway	Outbound internet access for private resources
Security Groups	Stateful instance-level traffic control
Network ACLs	Subnet-level traffic control
Elastic IP	Static public addressing
Route 53	DNS management (optional)
Compute & Load Balancing
Service	Purpose
Amazon EC2	Application compute
Launch Templates	Standardized EC2 configuration
Auto Scaling Groups	Horizontal scaling and instance replacement
Application Load Balancer	Application traffic distribution
Target Groups	Backend instance registration
Health Checks	Workload health validation
Storage & Database
Service	Purpose
Amazon S3	Object and static asset storage
Amazon EBS	EC2 block storage
Amazon RDS for PostgreSQL	Relational database
Identity & Security
IAM Roles & Policies
IAM Instance Profiles
Least-Privilege Access
Security Groups
Key Pairs
AWS KMS (optional)
AWS Secrets Manager (optional)
Monitoring
Amazon CloudWatch
Infrastructure metrics
Basic logs
Health monitoring
Operational visibility
🏢 Infrastructure Design

The infrastructure follows a layered architecture:

                    AWS Infrastructure
                           │
        ┌──────────────────┼──────────────────┐
        │                  │                  │
    Networking          Compute           Data Layer
        │                  │                  │
       VPC             EC2 / ASG       RDS PostgreSQL
    Subnets              ALB                  S3
    Routing
    Security
Synchronous Application Flow

The application follows a traditional synchronous request/response model:

Client
  │
  ▼
ALB
  │
  ▼
EC2 / Auto Scaling Group
  │
  ▼
RDS PostgreSQL

S3 is used for object and static asset storage where required.

🧩 Terraform Architecture

Terraform is organized using reusable modules:

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

Each environment consumes the reusable Terraform modules with environment-specific configuration.

Terraform Workflow
Terraform Configuration
          │
          ▼
       Modules
          │
          ▼
     Environment
          │
          ▼
    Terraform Plan
          │
          ▼
    Infrastructure
          │
          ▼
         AWS
🔐 Security

Security is incorporated into the infrastructure design rather than added after deployment.

Key practices include:

Least-privilege IAM policies
IAM roles instead of embedded credentials
IAM instance profiles for EC2
Private subnets for backend resources
Restricted security-group rules
Network ACL controls
Secrets Manager for sensitive application secrets
KMS encryption where required
No hard-coded AWS credentials
Sensitive Terraform files excluded through .gitignore
💰 Cost Awareness

The project considers AWS cost during infrastructure design.

Key practices include:

Environment separation
Right-sized resources
Controlled NAT Gateway usage
Appropriate storage configuration
Resource tagging
Avoiding unnecessary always-on resources
LocalStack-based development where practical
Destroying temporary environments after testing
🚀 Application Deployment

A sample multi-tier web application is deployed on the infrastructure created by Terraform.

Application Flow
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

The application demonstrates:

Application server configuration
Environment variables
Database connectivity
S3 integration
IAM permissions
Application health checks
Basic failure and recovery testing
🔄 Infrastructure CI/CD

GitHub Actions automates the Terraform infrastructure workflow.

Pipeline
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
CI/CD Capabilities
GitHub Actions
Pull Request workflow
Terraform formatting
Terraform validation
Security scanning
Terraform plan
Manual approval
Terraform apply
Branch protection
Dev / Stage / Prod deployment
AWS OIDC authentication
🧪 Testing & Validation
Infrastructure
Terraform validation
Infrastructure provisioning
Resource verification
Network connectivity testing
Security validation
Application
Application accessibility
ALB health checks
Database connectivity
S3 integration
Application health checks
Reliability
Auto Scaling validation
Instance replacement
Load balancer health checks
Failure testing
Recovery testing
Cost
Resource review
Environment cleanup
Cost-aware configuration validation
📁 Repository Structure
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
│   ├── ec2/
│   ├── alb/
│   ├── rds/
│   ├── s3/
│   ├── iam/
│   └── cloudwatch/
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
🔮 Project Scope

This project intentionally focuses on a traditional AWS web application architecture.

Serverless and event-driven workloads are maintained separately in:

AWS Serverless Event-Driven Processing Platform

The separate project covers:

API Gateway
     │
     ▼
  Lambda
     │
     ▼
    SQS
     │
     ▼
  Lambda
   │   │
   ▼   ▼
DynamoDB SNS

Keeping the architectures separate makes each project easier to:

Understand
Implement
Troubleshoot
Test
Explain in technical interviews
📌 Project Summary

AWS Infrastructure Automation Platform using Terraform demonstrates how to design, automate, secure, deploy, and validate a multi-tier AWS web application infrastructure using Infrastructure as Code and CI/CD practices.

👨‍💻 Author

Samrat Rishav

📄 License

This project is licensed under the MIT License.
