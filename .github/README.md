# GitHub Actions Workflows

This directory contains GitHub Actions workflows for the Tyche Tagging project.

## Workflows

### [test.yml](workflows/test.yml)
**Main testing workflow** - Runs on every push and PR
- **Triggers**: Push to main/develop, PRs, manual dispatch
- **Jobs**:
  - `test-aws-module`: Validates Terraform syntax, runs examples
  - `test-module-outputs`: Tests all module outputs
  - `security-scan`: Runs TFSec and Checkov security scans
  - `lint-documentation`: Validates README structure and links
  - `integration-test`: Creates real AWS resources for testing (PRs and main only)
  - `notify`: Reports overall test results

### [release.yml](workflows/release.yml)
**Release and publishing workflow** - Runs on version tags
- **Triggers**: Version tags (v*), manual dispatch
- **Jobs**:
  - `create-release`: Creates GitHub release with changelog
  - `test-before-release`: Runs full test suite before release
  - `publish-to-registry`: Publishes to Terraform Registry
  - `notify-release`: Reports release status

### [security.yml](workflows/security.yml)
**Security and dependency scanning** - Runs weekly and on PRs
- **Triggers**: Weekly schedule, push to main, PRs, manual dispatch
- **Jobs**:
  - `dependency-review`: Reviews PR dependencies
  - `security-scan`: TFSec and Checkov security scans
  - `codeql-analysis`: GitHub CodeQL analysis
  - `license-check`: Validates license files
  - `vulnerability-scan`: Trivy vulnerability scanning
  - `update-dependencies`: Checks for dependency updates
  - `notify-security`: Reports security status

### [pr-validation.yml](workflows/pr-validation.yml)
**PR validation and auto-formatting** - Runs on PRs
- **Triggers**: PRs to main/develop, manual dispatch
- **Jobs**:
  - `validate-pr`: Comprehensive PR validation
  - `auto-format`: Auto-formats Terraform files
  - `comment-results`: Comments PR with validation results

### [registry-test.yml](workflows/registry-test.yml)
**Registry module testing** - Runs daily
- **Triggers**: Daily schedule, manual dispatch
- **Jobs**:
  - `test-registry-module`: Tests module availability from Terraform Registry

## Required Secrets

The following secrets must be configured in the repository settings:

### AWS Credentials
- `AWS_ACCESS_KEY_ID`: AWS access key for testing
- `AWS_SECRET_ACCESS_KEY`: AWS secret key for testing

### GitHub Token
- `GITHUB_TOKEN`: Automatically provided by GitHub Actions

## Workflow Features

### Security
- **TFSec**: Terraform security scanner
- **Checkov**: Infrastructure security scanner
- **CodeQL**: GitHub's semantic code analysis
- **Trivy**: Vulnerability scanner
- **Dependency Review**: Checks for vulnerable dependencies

### Testing
- **Syntax Validation**: Terraform fmt and validate
- **Example Testing**: Validates all examples
- **Integration Testing**: Creates real AWS resources
- **Registry Testing**: Tests module from Terraform Registry
- **Output Testing**: Validates all module outputs

### Documentation
- **README Validation**: Checks documentation structure
- **Link Checking**: Validates markdown links
- **License Checking**: Ensures license files exist

### Automation
- **Auto-formatting**: Formats Terraform files automatically
- **PR Comments**: Provides feedback on PRs
- **Release Automation**: Creates releases with changelogs
- **Registry Publishing**: Publishes to Terraform Registry

## Usage

### Running Tests Locally
```bash
# Run the validation script
cd aws
./validate.sh

# Test examples
cd examples/basic
terraform init
terraform plan -var-file="test.tfvars"
```

### Creating a Release
```bash
# Create and push a version tag
git tag v1.0.0
git push origin v1.0.0

# Or use the manual workflow dispatch
# Go to Actions > Release and Publish > Run workflow
```

### Manual Workflow Dispatch
All workflows support manual dispatch:
1. Go to the Actions tab
2. Select the desired workflow
3. Click "Run workflow"
4. Choose the branch and any required inputs

## Workflow Status Badges

Add these badges to your README:

```markdown
[![Test](https://github.com/YakShavingCatHerder/tyche-tagging/workflows/Test%20Module/badge.svg)](https://github.com/YakShavingCatHerder/tyche-tagging/actions/workflows/test.yml)
[![PR Validation](https://github.com/YakShavingCatHerder/tyche-tagging/workflows/PR%20Validation/badge.svg)](https://github.com/YakShavingCatHerder/tyche-tagging/actions/workflows/pr-validation.yml)
[![Release](https://github.com/YakShavingCatHerder/tyche-tagging/workflows/Release/badge.svg)](https://github.com/YakShavingCatHerder/tyche-tagging/actions/workflows/release.yml)
[![Registry Test](https://github.com/YakShavingCatHerder/tyche-tagging/workflows/Test%20Module%20from%20Registry/badge.svg)](https://github.com/YakShavingCatHerder/tyche-tagging/actions/workflows/registry-test.yml)
```

## Troubleshooting

### Common Issues

1. **AWS Credentials**: Ensure AWS secrets are configured
2. **Terraform Version**: Check if TF_VERSION needs updating
3. **Module Structure**: Verify all required files exist
4. **Documentation**: Ensure README files have required sections

### Debug Mode
Enable debug logging by adding this to workflow steps:
```yaml
env:
  ACTIONS_STEP_DEBUG: true
  ACTIONS_RUNNER_DEBUG: true
```

## Contributing

When adding new workflows:
1. Follow the naming convention: `kebab-case.yml`
2. Include proper triggers and conditions
3. Add appropriate error handling
4. Update this README
5. Test the workflow thoroughly
