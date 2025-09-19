# Data sources for AWS context
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

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
    CostCenter  = var.cost_center != "" ? var.cost_center : var.team
    Owner       = var.owner != "" ? var.owner : "${var.team}@${var.organization_domain}"
    
    # AWS context for multi-account enterprises
    AWSAccount = data.aws_caller_identity.current.account_id
    AWSRegion  = data.aws_region.current.id
  }
  
  # Final tag set - merge core tags with additional tags
  standard_tags = merge(
    local.core_tags,
    var.additional_tags
  )
}
