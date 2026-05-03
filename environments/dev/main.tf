#S3 Storage
# Provision secure S3 bucket for development

module "secure_s3" {
  source      = "../../modules/s3"
  bucket_name = "engine-dev-secure-bucket"
  tags        = local.common_tags
  enable_iam  = false
}

#IAM Role For S3 Access
# EC2 instances will assume this role

module "iam_s3_read_role" {
  source = "../../modules/iam"

  role_name         = "engine-dev-s3-read-role"
  service_principal = "ec2.amazonaws.com"

  policy_actions = [
    "s3:GetObject",
    "s3:ListBucket"
  ]

  policy_resources = [
    module.secure_s3.bucket_arn,
    "${module.secure_s3.bucket_arn}/*"
  ]
  tags = local.common_tags
}

# EC2 Compute Layer
# Launch development compute instance

# module "ec2_engine" {
#   source        = "../../modules/ec2"
#   instance_name = "engine-dev-instance"
#   iam_role_name = module.iam_s3_read_role.role_name
#   tags          = local.common_tags

#   subnet_id = module.vpc.public_subnet_ids[0]
# }

#Load balancer (Traffic Control Layer)
#Routes traffic to EC2 instances

# module "alb" {
#   source      = "../../modules/alb"
#   instance_id = module.ec2_engine.instance_id
#   tags        = local.common_tags
# }

# VPC (Network Foundation Layer - Dev)
# Creates isolated network with multi-AZ subnets

module "vpc" {
  source             = "../../modules/vpc"
  cidr_block         = "10.0.0.0/16"
  availability_zones = ["us-east-1a", "us-east-1b"]
  tags               = local.common_tags
}