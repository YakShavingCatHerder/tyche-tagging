# Main Tyche Tagging Module
# This module provides standardized tagging across cloud providers

locals {
  # Generate timestamp for resource creation tracking
  created_date = formatdate("YYYY-MM-DD", timestamp())

  # Core tags required for cost attribution
  core_tags = {
    # Essential for cost attribution
    Team        = var.team
    Project     = var.project
    Environment = var.environment

    # Governance and tracking
    ManagedBy   = "terraform"
    CreatedDate = local.created_date

    # Cost allocation
    CostCenter = var.cost_center != "" ? var.cost_center : var.team
    Owner      = var.owner != "" ? var.owner : "${var.team}@${var.organization_domain}"
  }

  # Final tag set - merge core tags with additional tags
  standard_tags = merge(
    local.core_tags,
    var.additional_tags
  )

  # Compute-specific tags
  compute_tags = merge(
    local.standard_tags,
    {
      ResourceType = "compute"
      BackupPolicy = var.environment == "production" ? "daily" : "weekly"
    }
  )

  # Storage-specific tags
  storage_tags = merge(
    local.standard_tags,
    {
      ResourceType = "storage"
      Encryption   = "required"
      BackupPolicy = var.environment == "production" ? "daily" : "weekly"
    }
  )

  # Database-specific tags
  database_tags = merge(
    local.standard_tags,
    {
      ResourceType = "database"
      BackupPolicy = "daily"
      Encryption   = "required"
    }
  )

  # Network-specific tags
  network_tags = merge(
    local.standard_tags,
    {
      ResourceType = "network"
      Monitoring   = "enabled"
    }
  )
}

# AWS Provider Module
module "aws" {
  source = "./modules/aws"

  tags          = local.standard_tags
  tags_compute  = local.compute_tags
  tags_storage  = local.storage_tags
  tags_database = local.database_tags
  tags_network  = local.network_tags
}
