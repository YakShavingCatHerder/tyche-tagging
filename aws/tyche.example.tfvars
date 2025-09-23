# Tyche Tagging Configuration
# Copy this file to tyche.tfvars and customize for your organization

# Required: Team and project information for cost attribution
team        = "platform-team"
project     = "user-service"
environment = "prod"

# Optional: Cost center for financial tracking (defaults to team name if not specified)
cost_center = "engineering"

# Optional: Owner contact (defaults to team@organization_domain if not specified)
owner = "platform-team@company.com"

# Optional: Organization domain for generating default contact emails
organization_domain = "company.com"

# Optional: Additional tags specific to your organization
additional_tags = {
  "BusinessUnit"   = "engineering"
  "Application"    = "user-management"
  "Compliance"     = "sox"
  "BackupRequired" = "true"
}

# Future: Enterprise features (coming soon)
# enterprise_features = {
#   compliance_scanning = true
#   cost_optimization  = true
#   ml_attribution     = true
# }
