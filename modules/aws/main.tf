# AWS-specific implementation of Tyche Tagging
# This file contains AWS-specific resource tagging logic

# AWS-specific data sources
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

# AWS-specific local values
locals {
  # AWS-specific tags
  aws_tags = {
    "aws:account-id"    = data.aws_caller_identity.current.account_id
    "aws:region"        = data.aws_region.current.id
    "aws:service"       = "tyche-tagging"
  }
  
  # Merge AWS-specific tags with standard tags
  aws_standard_tags = merge(var.tags, local.aws_tags)
  aws_compute_tags  = merge(var.tags_compute, local.aws_tags)
  aws_storage_tags  = merge(var.tags_storage, local.aws_tags)
  aws_database_tags = merge(var.tags_database, local.aws_tags)
  aws_network_tags  = merge(var.tags_network, local.aws_tags)
}

# AWS-specific outputs
output "aws_account_id" {
  description = "AWS Account ID"
  value       = data.aws_caller_identity.current.account_id
}

output "aws_region" {
  description = "AWS Region"
  value       = data.aws_region.current.id
}

output "aws_tags" {
  description = "AWS-specific tags with standard tags"
  value       = local.aws_standard_tags
}

output "aws_compute_tags" {
  description = "AWS-specific compute tags"
  value       = local.aws_compute_tags
}

output "aws_storage_tags" {
  description = "AWS-specific storage tags"
  value       = local.aws_storage_tags
}

output "aws_database_tags" {
  description = "AWS-specific database tags"
  value       = local.aws_database_tags
}

output "aws_network_tags" {
  description = "AWS-specific network tags"
  value       = local.aws_network_tags
}
