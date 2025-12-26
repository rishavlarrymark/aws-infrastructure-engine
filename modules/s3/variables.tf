variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "tags" {
  description = "Mandatory tags"
  type        = map(string)
}

variable "enable_iam" {
  description = "Whether to create IAM policy"
  type        = bool
  default     = false
}
