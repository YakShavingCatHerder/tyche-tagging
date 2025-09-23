# Tyche Tagging

[![Test](https://github.com/YakShavingCatHerder/tyche-tagging/workflows/Test%20Tyche%20Tagging%20Module/badge.svg)](https://github.com/YakShavingCatHerder/tyche-tagging/actions/workflows/test.yml)
[![Security](https://github.com/YakShavingCatHerder/tyche-tagging/workflows/Security%20and%20Dependency%20Updates/badge.svg)](https://github.com/YakShavingCatHerder/tyche-tagging/actions/workflows/security.yml)
[![Registry Test](https://github.com/YakShavingCatHerder/tyche-tagging/workflows/Test%20Module%20from%20Registry/badge.svg)](https://github.com/YakShavingCatHerder/tyche-tagging/actions/workflows/registry-test.yml)

**Standardized cloud resource tagging for cost attribution and team accountability.**

Eliminate unallocated cloud spend with consistent, automated tagging across all your cloud resources.

## Supported Providers

**AWS** - [terraform-aws-tyche-tags](./aws/) - Complete AWS resource tagging solution

- **Azure** - Coming soon
- **GCP** - Coming soon

## Quick Start

### AWS

```hcl
module "tyche_tags" {
  source = "YakShavingCatHerder/tyche-tagging/aws"
  
  team                = "platform-team"
  project             = "user-service"
  environment         = "prod"
  cost_center         = "engineering"
  organization_domain = "company.com"
}

resource "aws_instance" "web" {
  ami           = "ami-0abcdef1234567890"
  instance_type = "t3.micro"
  tags          = module.tyche_tags.tags
}
```

## Features

- **Consistent tagging** across all cloud resource types
- **Cost attribution** with team, project, and environment tracking
- **Automatic governance tags** (creation date, owner, managed by)
- **Multi-cloud context** (account ID, region) for enterprise deployments
- **Flexible configuration** via simple tfvars files

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
- Cloud Provider >= 4.0 (AWS), >= 3.0 (Azure), >= 4.0 (GCP)

## CI/CD

This project uses GitHub Actions for automated testing, security scanning, and releases:

- **Testing**: Automated validation on every PR and push
- **Security**: Weekly security scans and vulnerability checks
- **Releases**: Automated releases to Terraform Registry
- **Quality**: Code formatting, documentation validation, and integration tests

See [.github/README.md](.github/README.md) for detailed workflow information. 

## Enterprise Features

Looking for advanced features like compliance scanning, cost optimization, or ML-powered attribution?
Contact us about [Tyche Enterprise](mailto:enterprise@tyche.dev) solutions.

## License

MIT License - see [LICENSE](./LICENSE) for details.
