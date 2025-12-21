variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "tags" {
  description = "Mandatory cost and ownership tags"
  type        = map(string)

  validation {
    condition = (
      contains(keys(var.tags), "Environment") &&
      contains(keys(var.tags), "Owner") &&
      contains(keys(var.tags), "CostCenter")
    )
    error_message = "Missing mandatory tags: Environment, Owner, CostCenter"
  }
}
