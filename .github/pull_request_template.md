## Description

<!-- Provide a brief description of the changes in this PR -->

## Type of Change

<!-- Mark the relevant option with an "x" -->

- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] Documentation update
- [ ] CI/CD workflow change
- [ ] Test improvement
- [ ] Refactoring (no functional changes)

## Module Affected

<!-- Mark the relevant option with an "x" -->

- [ ] AWS Module
- [ ] Azure Module (coming soon)
- [ ] GCP Module (coming soon)
- [ ] Documentation
- [ ] CI/CD Workflows
- [ ] All Modules

## Changes Made

<!-- List the specific changes made in this PR -->

- 
- 
- 

## Testing

<!-- Describe how you tested these changes -->

- [ ] Ran existing tests
- [ ] Added new tests
- [ ] Tested locally with Terraform
- [ ] Tested with different Terraform versions
- [ ] Tested with different cloud providers

### Test Configuration

<!-- If applicable, provide the Terraform configuration used for testing -->

```hcl
module "tyche_tags" {
  source = "YakShavingCatHerder/tyche-tagging/aws"
  
  team                = "test-team"
  project             = "test-project"
  environment         = "test"
  cost_center         = "testing"
  organization_domain = "example.com"
}
```

## Breaking Changes

<!-- If this is a breaking change, describe what breaks and how to migrate -->

- [ ] This is a breaking change
- [ ] This is not a breaking change

<!-- If breaking change, provide migration instructions -->

## Documentation

<!-- Mark the relevant option with an "x" -->

- [ ] Documentation has been updated
- [ ] README has been updated
- [ ] Examples have been updated
- [ ] No documentation changes needed

## Release Notes

<!-- What should be included in the release notes for this change? -->

## Checklist

<!-- Mark completed items with an "x" -->

- [ ] My code follows the project's style guidelines
- [ ] I have performed a self-review of my own code
- [ ] I have commented my code, particularly in hard-to-understand areas
- [ ] I have made corresponding changes to the documentation
- [ ] My changes generate no new warnings
- [ ] I have added tests that prove my fix is effective or that my feature works
- [ ] New and existing unit tests pass locally with my changes
- [ ] Any dependent changes have been merged and published

## Related Issues

<!-- Link to any related issues -->

- Fixes #
- Closes #
- Related to #

## Additional Notes

<!-- Any additional information that reviewers should know -->
