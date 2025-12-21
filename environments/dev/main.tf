module "secure_s3" {
  source = "../../modules/s3"

  bucket_name = "engine-dev-secure-bucket"

  tags = {
    Environment = "dev"
    Owner       = "Rishav-Larrymark"
    CostCenter  = "cloud-engineering"
  }
}
