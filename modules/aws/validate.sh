#!/bin/bash

# Simple validation script for terraform-aws-tyche-tags module
set -e

echo "Validating Terraform AWS Tyche Tags module..."

# Test 1: Module syntax validation
echo "Test 1: Module syntax validation"
terraform init > /dev/null
terraform validate
echo " Module syntax is valid"

# Test 2: Example validation
echo "Test 2: Example validation"
cd examples/basic
terraform validate
echo " Example syntax is valid \n"

# Test 3: Module planning (with mock AWS)
echo "Test 3: Module planning test"
terraform plan -var-file="test.tfvars" > /dev/null
echo " Module planning successful"

cd ../..

echo ""
echo "All validation tests passed!"
echo "Module is ready for Terraform Registry publication."
