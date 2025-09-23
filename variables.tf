variable "team" {
  description = "Team name responsible for the resources (required for cost attribution)"
  type        = string

  validation {
    condition     = length(var.team) > 0
    error_message = "Team name must not be empty."
  }
}

variable "project" {
  description = "Project name that the resources belong to"
  type        = string

  validation {
    condition     = length(var.project) > 0
    error_message = "Project name must not be empty."
  }
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string

  validation {
    condition     = contains(["dev", "staging", "prod", "test"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod, test."
  }
}

variable "cost_center" {
  description = "Cost center for financial tracking (optional, defaults to team name)"
  type        = string
  default     = ""
}

variable "owner" {
  description = "Owner contact information (optional, defaults to team@organization)"
  type        = string
  default     = ""
}

variable "organization_domain" {
  description = "Organization domain for generating default owner emails"
  type        = string
  default     = "company.com"
}

variable "additional_tags" {
  description = "Additional tags to merge with standard tags"
  type        = map(string)
  default     = {}
}
