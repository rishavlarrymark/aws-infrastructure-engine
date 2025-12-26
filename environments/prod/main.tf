module "secure_s3" {
  source      = "../../modules/s3"
  bucket_name = "engine-prod-secure-bucket"
  tags        = local.common_tags
  enable_iam  = true
}
