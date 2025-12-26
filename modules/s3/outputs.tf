output "bucket_name" {
  value = aws_s3_bucket.this.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.this.arn
}

output "read_only_policy_arn" {
  value       = var.enable_iam ? aws_iam_policy.s3_read_only[0].arn : null
  description = "IAM policy ARN if enabled"
}
