output "tags" {
  description = "Standard tags for all AWS resources"
  value       = local.standard_tags
}

output "tags_compute" {
  description = "Tags optimized for compute resources (EC2, ECS, etc.)"
  value = merge(local.standard_tags, {
    ResourceType = "compute"
  })
}

output "tags_storage" {
  description = "Tags optimized for storage resources (S3, EBS, etc.)"
  value = merge(local.standard_tags, {
    ResourceType = "storage"
  })
}

output "tags_database" {
  description = "Tags optimized for database resources (RDS, DynamoDB, etc.)"
  value = merge(local.standard_tags, {
    ResourceType = "database"
  })
}

output "tags_network" {
  description = "Tags optimized for network resources (VPC, ALB, etc.)"
  value = merge(local.standard_tags, {
    ResourceType = "network"
  })
}

# Simplified output for basic usage
output "standard_tags" {
  description = "Standard tags for all resources (alias for tags)"
  value       = local.standard_tags
}
