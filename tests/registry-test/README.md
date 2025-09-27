# Registry Test

This directory contains tests for the tyche-tagging module from the Terraform Registry.

## Usage

```bash
cd tests/registry-test
terraform init
terraform plan -var="module_version=1.0.5"
```

## Purpose

- Tests the module as it would be used by end users
- Validates module availability from Terraform Registry
- Ensures module works with different versions
- Verifies module outputs and functionality
