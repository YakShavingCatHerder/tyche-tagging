# AWS Module - Tyche Tagging

**Standardized AWS resource tagging for cost attribution and team accountability.**

This is the AWS provider module for Tyche Tagging. It provides consistent, automated tagging across all your AWS resources to eliminate unallocated cloud spend.

> **Note**: This is a submodule of the [Tyche Tagging](https://github.com/YakShavingCatHerder/tyche-tagging) project. For multi-cloud support and the latest updates, see the main repository.

## What is this module?
This is the AWS provider submodule of the Tyche Tagging project. It provides a standardized set of tags for AWS resources to enable cost attribution, team accountability, and governance. It generates consistent tags across all AWS resource types and is designed to be used as part of the larger Tyche Tagging ecosystem.

**This module is:**
- An AWS-specific submodule of Tyche Tagging
- Published to the Terraform Registry
- Ready to use for AWS resource tagging
- Part of a multi-cloud tagging solution

**Use this module when you need:**
- Consistent tagging across all AWS resources
- Cost attribution and team accountability
- Automated governance tags
- Multi-account AWS environment support

## Features
- **Consistent tagging** across all AWS resource types
- **Cost attribution** with team, project, and environment tracking
- **Automatic governance tags** (creation date, owner, managed by)
- **AWS context** (account ID, region) for multi-account enterprises
- **Flexible configuration** via simple tfvars files

## Quick Start
This module is designed to be used directly in your Terraform configurations. Here's how to get started:

1. **Create configuration file:**
```hcl
# tyche.tfvars
tyche_config = {
  team        = "platform-team"
  project     = "user-service"
  environment = "prod"
  cost_center = "engineering"
}
```

2. **Use the module:**
```hcl
module "tyche_tags" {
  source = "YakShavingCatHerder/tyche-tagging/aws"
  
  team                = var.tyche_config.team
  project             = var.tyche_config.project
  environment         = var.tyche_config.environment
  cost_center         = var.tyche_config.cost_center
  organization_domain = "company.com"
}

resource "aws_instance" "web" {
  ami           = "ami-0abcdef1234567890"
  instance_type = "t3.micro"
  tags          = module.tyche_tags.tags
}
```

3. **Deploy:**
```bash
terraform apply -var-file="tyche.tfvars"
```

## Generated Tags

Every resource gets these standard tags:
| Tag             | Example                       | Purpose               |
| --------------- | ----------------------------- | --------------------- |
| `Team`        | `platform-team`             | Cost attribution      |
| `Project`     | `user-service`              | Project tracking      |
| `Environment` | `prod`                      | Environment isolation |
| `CostCenter`  | `engineering`               | Financial allocation  |
| `Owner`       | `platform-team@company.com` | Contact info          |
| `ManagedBy`   | `terraform`                 | Governance            |
| `CreatedDate` | `2024-09-18`                | Lifecycle tracking    |
| `AWSAccount`  | `123456789012`              | Multi-account context |
| `AWSRegion`   | `us-east-1`                 | Regional context      |

## Requirements
- Terraform >= 1.0
- AWS Provider >= 4.0

## Validation
This module has been validated using:

### Manual Testing
```bash
# Test module initialization and planning
cd examples/basic
terraform init
terraform plan -var-file="test.tfvars"
# Result: Module loads successfully, no errors
# Result: Tags generated correctly for all resource types
# Result: AWS context (account, region) populated automatically
```

### Generated Tags Example

When configured with:
```hcl
team        = "test-team"
project     = "test-project" 
environment = "dev"
cost_center = "engineering"
```

The module generates these tags:
- `Team`: `test-team`
- `Project`: `test-project`
- `Environment`: `dev`
- `CostCenter`: `engineering`
- `Owner`: `test-team@company.com`
- `ManagedBy`: `terraform`
- `CreatedDate`: `2024-09-18`
- `AWSAccount`: `975050275983`
- `AWSRegion`: `us-east-1`

### Input Validation
- Empty team names are rejected
- Invalid environments are rejected
- Empty project names are rejected
- Additional tags are merged correctly

## Examples

See the [examples/](./examples/) directory for complete usage examples.

## Enterprise Features

Looking for advanced features like compliance scanning, cost optimization, or ML-powered attribution?
Contact me about [Tyche Enterprise](mailto:yakshavingcatherder@pm.me) solutions.

## License
MIT License - see [LICENSE](./LICENSE) for details.
