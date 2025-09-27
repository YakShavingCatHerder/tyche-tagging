module "tyche_tags" {
  source = "YakShavingCatHerder/tyche-tagging/aws"
  version = "1.0.8"
  
  team                = "test-team"
  project             = "registry-test"
  environment         = "test"
  cost_center         = "testing"
  organization_domain = "example.com"
}

output "tags" {
  value = module.tyche_tags.tags
}
