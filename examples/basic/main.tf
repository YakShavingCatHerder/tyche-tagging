# Basic example of using the Tyche tagging module
# This example shows the minimum configuration needed for cost attribution

terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Load configuration from tfvars file
variable "tyche_config" {
  description = "Tyche tagging configuration"
  type = object({
    team                = string
    project             = string
    environment         = string
    cost_center         = optional(string, "")
    owner               = optional(string, "")
    organization_domain = optional(string, "company.com")
    additional_tags     = optional(map(string), {})
  })
}

# Use the Tyche tagging module
module "tyche_tags" {
  source = "../.."  # Local path to module root
  
  team                = var.tyche_config.team
  project             = var.tyche_config.project
  environment         = var.tyche_config.environment
  cost_center         = var.tyche_config.cost_center
  owner               = var.tyche_config.owner
  organization_domain = var.tyche_config.organization_domain
  additional_tags     = var.tyche_config.additional_tags
}

# Example: Apply tags to an EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0abcdef1234567890"
  instance_type = "t3.micro"
  
  tags = module.tyche_tags.tags
}

# Example: Apply specialized tags to an S3 bucket
resource "aws_s3_bucket" "example" {
  bucket = "example-bucket-${random_string.suffix.result}"
  
  tags = module.tyche_tags.tags_storage
}

resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}
