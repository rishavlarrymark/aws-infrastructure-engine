output "s3_bucket_name" {
  value = module.secure_s3.bucket_name
}

output "s3_bucket_arn" {
  value = module.secure_s3.bucket_arn
}

output "iam_role_name" {
  value = module.iam_s3_read_role.role_name
}
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "igw_id" {
  value = module.vpc.igw_id
}