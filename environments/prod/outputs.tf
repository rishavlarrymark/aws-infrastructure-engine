output "bucket_name" {
  value = module.secure_s3.bucket_name
}

output "bucket_arn" {
  value = module.secure_s3.bucket_arn
}

output "read_only_policy_arn" {
  value = module.secure_s3.read_only_policy_arn
}
