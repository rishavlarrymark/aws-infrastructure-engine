output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = aws_subnet.private[*].id
}

output "igw_id" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.this.id
}

output "public_subnet_az_mapping" {
  description = "Mapping of public subnets to AZs"
  value = [
    for i in range(length(aws_subnet.public)) : {
      subnet_id = aws_subnet.public[i].id
      az        = aws_subnet.public[i].availability_zone
    }
  ]
}