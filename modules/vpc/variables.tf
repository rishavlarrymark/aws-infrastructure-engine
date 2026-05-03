variable "cidr_block" {
  description = "VPC CIDR"
  type        = string

  validation {
    condition = can(cidrhost(var.cidr_block, 0)) && (
      tonumber(split("/", var.cidr_block)[1]) >= 16 &&
      tonumber(split("/", var.cidr_block)[1]) <= 24
    )
    error_message = "CIDR must be valid and between /16 and /24."
  }
}

variable "availability_zones" {
  description = "List of AZs for subnet distribution"
  type        = list(string)

  validation {
    condition     = length(var.availability_zones) >= 2
    error_message = "At least two availability zones are required for high availability."
  }
}

variable "tags" {
  description = "Mandatory cost tags"
  type        = map(string)

  validation {
    condition = (
      contains(keys(var.tags), "Environment") &&
      contains(keys(var.tags), "Owner") &&
      contains(keys(var.tags), "CostCenter") &&

      var.tags["Environment"] != "" &&
      var.tags["Owner"] != "" &&
      var.tags["CostCenter"] != ""
    )

    error_message = "Tags must include Environment, Owner, CostCenter and must not be empty."
  }
}