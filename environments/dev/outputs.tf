output "s3_bucket_name" {
  value = module.secure_s3.bucket_name
}

output "s3_bucket_arn" {
  value = module.secure_s3.bucket_arn
}

output "iam_role_name" {
  value = module.iam_s3_read_role.role_name
}
