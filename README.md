# Terraform AWS Tyche Tags


**Standardized AWS resource tagging for cost attribution and team accountability.**

Eliminate unallocated cloud spend with consistent, automated tagging across all your AWS resources.

## Features

- **Consistent tagging** across all AWS resource types
- **Cost attribution** with team, project, and environment tracking
- **Automatic governance tags** (creation date, owner, managed by)
- **AWS context** (account ID, region) for multi-account enterprises
- **Flexible configuration** via simple tfvars files

## Quick Start

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
  source = "YakShavingCatHerder/tyche-tags/aws"
  
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

| Tag | Example | Purpose |
|-----|---------|---------|
| `Team` | `platform-team` | Cost attribution |
| `Project` | `user-service` | Project tracking |
| `Environment` | `prod` | Environment isolation |
| `CostCenter` | `engineering` | Financial allocation |
| `Owner` | `platform-team@company.com` | Contact info |
| `ManagedBy` | `terraform` | Governance |
| `CreatedDate` | `2024-09-18` | Lifecycle tracking |
| `AWSAccount` | `123456789012` | Multi-account context |
| `AWSRegion` | `us-east-1` | Regional context |

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
# ✅ Result: Module loads successfully, no errors
# ✅ Result: Tags generated correctly for all resource types
# ✅ Result: AWS context (account, region) populated automatically
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
- ✅ Empty team names are rejected
- ✅ Invalid environments are rejected  
- ✅ Empty project names are rejected
- ✅ Additional tags are merged correctly

## Examples

See the [examples/](./examples/) directory for complete usage examples.

## Enterprise Features

Looking for advanced features like compliance scanning, cost optimization, or ML-powered attribution? 
Contact us about [Tyche Enterprise](mailto:enterprise@tyche.dev) solutions.

## License

MIT License - see [LICENSE](./LICENSE) for details.
