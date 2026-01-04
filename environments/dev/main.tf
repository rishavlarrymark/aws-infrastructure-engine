module "secure_s3" {
  source      = "../../modules/s3"
  bucket_name = "engine-dev-secure-bucket"
  tags        = local.common_tags
  enable_iam  = false
}
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

  tags = {
    Environment = "dev"
    Owner       = "rishav-larrymark"
    CostCenter  = "cloud-engineering"
  }
}

