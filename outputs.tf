# Outputs from AWS module
output "tags" {
  description = "Standard tags for all AWS resources"
  value       = module.aws.aws_tags
}

output "tags_compute" {
  description = "Tags optimized for compute resources (EC2, ECS, etc.)"
  value       = module.aws.aws_compute_tags
}

output "tags_storage" {
  description = "Tags optimized for storage resources (S3, EBS, etc.)"
  value       = module.aws.aws_storage_tags
}

output "tags_database" {
  description = "Tags optimized for database resources (RDS, DynamoDB, etc.)"
  value       = module.aws.aws_database_tags
}

output "tags_network" {
  description = "Tags optimized for network resources (VPC, ALB, etc.)"
  value       = module.aws.aws_network_tags
}

# Simplified output for basic usage
output "standard_tags" {
  description = "Standard tags for all resources (alias for tags)"
  value       = module.aws.aws_tags
}

# AWS-specific outputs
output "aws_account_id" {
  description = "AWS Account ID"
  value       = module.aws.aws_account_id
}

output "aws_region" {
  description = "AWS Region"
  value       = module.aws.aws_region
}
